import 'package:challenge_bloc/app/app.dart';
import 'package:challenge_bloc/bootstrap.dart';
import 'package:challenge_bloc/common/utils/service/local_store_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/.env');

  await bootstrap(() async {
    final localStorageManager = LocalStorageManager();
    await localStorageManager.init();
    return App(localStorageManager: localStorageManager);
  });
}
