import 'package:flutter/material.dart';

class DebtsScreen extends StatelessWidget {
  const DebtsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debts Overview')),
      body: const Center(child: Text('Debt list will appear here.')),
    );
  }
}
