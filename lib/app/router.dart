import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../modules/auth/presentation/screens/login_screen.dart';
import '../../modules/dashboard/presentation/screens/dashboard_screen.dart';
import '../../modules/transactions/presentation/screens/transactions_screen.dart';
import '../../modules/debts/presentation/screens/debts_screen.dart';
import '../../modules/reminders/presentation/screens/reminders_screen.dart';
import '../../modules/profile/presentation/screens/profile_screen.dart';
import 'main_layout.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/transactions',
          builder: (context, state) => const TransactionsScreen(),
        ),
        GoRoute(
          path: '/debts',
          builder: (context, state) => const DebtsScreen(),
        ),
        GoRoute(
          path: '/reminders',
          builder: (context, state) => const RemindersScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
