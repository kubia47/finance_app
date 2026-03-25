import '../../../../core/network/api_client.dart';
import '../models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> getUserProfile();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await apiClient.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    
    final token = response.data['token'];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);

    return UserModel.fromJson(response.data['user']);
  }

  @override
  Future<UserModel> getUserProfile() async {
    final response = await apiClient.get('/auth/me');
    return UserModel.fromJson(response.data);
  }
}
