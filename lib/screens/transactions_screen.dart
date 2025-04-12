import 'package:flutter/material.dart';
import 'package:madrasa_fund_management/models/transaction.dart';
import 'package:madrasa_fund_management/utils/database_helper.dart';
import 'package:madrasa_fund_management/widgets/transaction_form.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<Transaction> _transactions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  Future<void> _loadTransactions() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('transactions');
    
    setState(() {
      _transactions = List.generate(maps.length, (i) {
        return Transaction.fromMap(maps[i]);
      });
      _isLoading = false;
    });
  }

  void _addTransaction() async {
    final result = await showModalBottomSheet<Transaction>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const TransactionForm();
      },
    );

    if (result != null) {
      setState(() {
        _transactions.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addTransaction,
        child: const Icon(Icons.add),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                final transaction = _transactions[index];
                return ListTile(
                  title: Text(transaction.description ?? 'No description'),
                  subtitle: Text('${transaction.type} - ${transaction.category}'),
                  trailing: Text('${transaction.amount}'),
                  onTap: () {
                    // Show transaction details
                  },
                );
              },
            ),
    );
  }
}