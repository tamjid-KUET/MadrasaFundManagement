import 'package:flutter/material.dart';
import 'package:madrasa_fund_management/models/entity.dart';
import 'package:madrasa_fund_management/utils/database_helper.dart';
import 'package:madrasa_fund_management/widgets/entity_form.dart';

class EntitiesScreen extends StatefulWidget {
  const EntitiesScreen({super.key});

  @override
  State<EntitiesScreen> createState() => _EntitiesScreenState();
}

class _EntitiesScreenState extends State<EntitiesScreen> {
  List<Entity> _entities = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEntities();
  }

  Future<void> _loadEntities() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('entities');
    
    setState(() {
      _entities = List.generate(maps.length, (i) {
        return Entity.fromMap(maps[i]);
      });
      _isLoading = false;
    });
  }

  void _addEntity() async {
    final result = await showModalBottomSheet<Entity>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const EntityForm();
      },
    );

    if (result != null) {
      setState(() {
        _entities.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addEntity,
        child: const Icon(Icons.add),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _entities.length,
              itemBuilder: (context, index) {
                final entity = _entities[index];
                return ListTile(
                  title: Text(entity.name),
                  subtitle: Text(entity.type),
                  trailing: Text(entity.phone ?? 'No phone'),
                  onTap: () {
                    // Show entity details
                  },
                );
              },
            ),
    );
  }
}