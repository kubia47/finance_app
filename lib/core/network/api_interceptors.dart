import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Stub: Implement exact refresh logic tailored to the backend
      bool refreshed = await _refreshToken();
      if (refreshed) {
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('access_token');
        err.requestOptions.headers['Authorization'] = 'Bearer $token';
        
        try {
          final dio = Dio();
          final response = await dio.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          return handler.next(err);
        }
      }
    }
    super.onError(err, handler);
  }

  Future<bool> _refreshToken() async {
    // Placeholder logic for calling the refresh token API and storing the new access_token
    return false;
  }
}
