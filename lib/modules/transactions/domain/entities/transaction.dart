import 'package:equatable/equatable.dart';

enum TransactionType { income, expense, debt, repayment, interest }

class Transaction extends Equatable {
  final String id;
  final TransactionType type;
  final String category;
  final double amount;
  final DateTime date;
  final String? note;

  const Transaction({
    required this.id,
    required this.type,
    required this.category,
    required this.amount,
    required this.date,
    this.note,
  });

  @override
  List<Object?> get props => [id, type, category, amount, date, note];
}
