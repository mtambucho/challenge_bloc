import 'package:challenge_bloc/app/app.dart';
import 'package:challenge_bloc/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/.env');

  await bootstrap(() {
    // final userRepository = UserRepository(
    //   authClient: authClient,
    //   databaseClient: databaseClient,
    // );
    return const App();
  });
}
