import 'package:flutter/material.dart';
import 'package:madrasa_fund_management/utils/backup_manager.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backup & Restore'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Local Backup'),
            subtitle: const Text('Save backup to device storage'),
            trailing: const Icon(Icons.save),
            onTap: () {
              BackupManager.createLocalBackup(context);
            },
          ),
          ListTile(
            title: const Text('Google Drive Backup'),
            subtitle: const Text('Save backup to your Google Drive'),
            trailing: const Icon(Icons.cloud_upload),
            onTap: () {
              BackupManager.createGoogleDriveBackup(context);
            },
          ),
          ListTile(
            title: const Text('Restore from Local'),
            subtitle: const Text('Restore from device storage'),
            trailing: const Icon(Icons.restore),
            onTap: () {
              BackupManager.restoreFromLocalBackup(context);
            },
          ),
          ListTile(
            title: const Text('Restore from Google Drive'),
            subtitle: const Text('Restore from your Google Drive'),
            trailing: const Icon(Icons.cloud_download),
            onTap: () {
              BackupManager.restoreFromGoogleDrive(context);
            },
          ),
        ],
      ),
    );
  }
}