import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (int index) => _onItemTapped(index, context),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.list_alt), label: 'Transactions'),
          NavigationDestination(icon: Icon(Icons.money_off), label: 'Debts'),
          NavigationDestination(icon: Icon(Icons.event_note), label: 'Reminders'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/transactions')) return 1;
    if (location.startsWith('/debts')) return 2;
    if (location.startsWith('/reminders')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/transactions');
        break;
      case 2:
        context.go('/debts');
        break;
      case 3:
        context.go('/reminders');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }
}
