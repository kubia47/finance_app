import 'package:equatable/equatable.dart';

class Reminder extends Equatable {
  final String id;
  final String title;
  final String? description;
  final DateTime notificationDate;
  final String? linkedDebtId;
  final String? linkedTransactionId;
  final bool isActive;

  const Reminder({
    required this.id,
    required this.title,
    this.description,
    required this.notificationDate,
    this.linkedDebtId,
    this.linkedTransactionId,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        notificationDate,
        linkedDebtId,
        linkedTransactionId,
        isActive,
      ];
}
