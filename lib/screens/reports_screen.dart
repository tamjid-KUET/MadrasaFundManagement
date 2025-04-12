import 'package:flutter/material.dart';
import 'package:madrasa_fund_management/utils/report_generator.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Generate Monthly Report'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              ReportGenerator.generateMonthlyReport(context);
            },
          ),
          ListTile(
            title: const Text('Generate Donation Report'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              ReportGenerator.generateDonationReport(context);
            },
          ),
          ListTile(
            title: const Text('Generate Expense Report'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              ReportGenerator.generateExpenseReport(context);
            },
          ),
        ],
      ),
    );
  }
}