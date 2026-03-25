import 'package:equatable/equatable.dart';

class PaymentSchedule extends Equatable {
  final DateTime date;
  final double amount;
  final bool isPaid;

  const PaymentSchedule({
    required this.date,
    required this.amount,
    this.isPaid = false,
  });

  @override
  List<Object?> get props => [date, amount, isPaid];
}

class Debt extends Equatable {
  final String id;
  final String name;
  final double principalAmount;
  final double? interestRate;
  final DateTime dueDate;
  final List<PaymentSchedule> paymentSchedule;

  const Debt({
    required this.id,
    required this.name,
    required this.principalAmount,
    this.interestRate,
    required this.dueDate,
    required this.paymentSchedule,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        principalAmount,
        interestRate,
        dueDate,
        paymentSchedule,
      ];
}
