import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              _buildBalanceCard(context),
              const SizedBox(height: 32),
              _buildLatestTransactions(),
              const SizedBox(height: 32),
              _buildCurrencySection(),
              const SizedBox(height: 100), // padding for bottom nav
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), // placeholder
        ),
        const SizedBox(width: 12),
        const Text(
          'Hi, Hoang!',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(CupertinoIcons.bell),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.chart_bar),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryYellow,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryYellow.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'VND',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          const Text(
            '1 USD = 25,430 VND',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          const Text(
            '150,540,000 đ',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -1),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '+ 1,250,000 đ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(Icons.arrow_upward, 'Pay'),
              _buildActionButton(Icons.swap_horiz, 'Transfer'),
              _buildActionButton(Icons.arrow_downward, 'Receive'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppColors.surfaceWhite,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.black, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildLatestTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Latest Transactions',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              'See All',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite,
            borderRadius: BorderRadius.circular(24),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: const Icon(CupertinoIcons.tv, color: Colors.greenAccent, size: 20),
            ),
            title: const Text('Megogo', style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: const Text('1 min ago', style: TextStyle(fontSize: 12)),
            trailing: const Text(
              '- 50,000 đ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.redNegative),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrencySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Currency',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildCurrencyCard('\$', 'US Dollar', '25,430', Colors.green),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildCurrencyCard('€', 'Euro', '27,100', Colors.blue),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: AppColors.white),
                    SizedBox(height: 8),
                    Text('Add\nCurrency', textAlign: TextAlign.center, style: TextStyle(color: AppColors.white, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCurrencyCard(String symbol, String name, String rate, Color symbolColor) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            symbol,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: symbolColor),
          ),
          const Spacer(),
          Text(
            name,
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 4),
          Text(
            rate,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 48),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(CupertinoIcons.creditcard, color: AppColors.textSecondary),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(CupertinoIcons.home, color: AppColors.white),
          ),
          const Icon(CupertinoIcons.settings, color: AppColors.textSecondary),
        ],
      ),
    );
  }
}
