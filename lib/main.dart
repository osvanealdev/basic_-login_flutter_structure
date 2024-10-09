import 'package:app_remision/core/settings/theme_settings.dart';
import 'package:app_remision/firebase_options.dart';
import 'package:app_remision/presentation/managers/bloc_manager.dart';
import 'package:app_remision/presentation/managers/repository_manager.dart';
import 'package:app_remision/presentation/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryManager(
      child: CubitBlocManager(
        child: Builder(builder: (context) {
          return MaterialApp.router(
            routerConfig: RouterConfiguration.routerConfig,
            title: 'App Remisión',
            theme: CustomThemeData(isDarkMode: true, context: context).getThemeData(),
          );
        }),
      ),
    );
  }
}
