import 'package:flutter/material.dart';
import 'package:madrasa_fund_management/screens/entities_screen.dart';
import 'package:madrasa_fund_management/screens/reports_screen.dart';
import 'package:madrasa_fund_management/screens/transactions_screen.dart';
import 'package:madrasa_fund_management/screens/backup_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const TransactionsScreen(),
    const EntitiesScreen(),
    const ReportsScreen(),
    const BackupScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Madrasa Fund Management'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Entities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.backup),
            label: 'Backup',
          ),
        ],
      ),
    );
  }
}