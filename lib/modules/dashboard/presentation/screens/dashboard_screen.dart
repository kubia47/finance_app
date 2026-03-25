import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildBalanceSummary(context),
          const SizedBox(height: 16),
          _buildIncomeExpenseRow(context),
          const SizedBox(height: 16),
          _buildUpcomingDebts(context),
        ],
      ),
    );
  }

  Widget _buildBalanceSummary(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text('Total Balance', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('\$12,450.00', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildIncomeExpenseRow(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Card(child: Padding(padding: EdgeInsets.all(16.0), child: Column(children: [Text('Income'), Text('\$4,200.00', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))]))),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Card(child: Padding(padding: EdgeInsets.all(16.0), child: Column(children: [Text('Expense'), Text('\$1,350.00', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))]))),
        ),
      ],
    );
  }

  Widget _buildUpcomingDebts(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Upcoming Debts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('Credit Card'),
              subtitle: const Text('Due in 3 days'),
              trailing: const Text('\$450.00', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              contentPadding: EdgeInsets.zero,
            )
          ],
        ),
      ),
    );
  }
}
