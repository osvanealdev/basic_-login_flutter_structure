import 'package:app_remision/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoryManager extends StatelessWidget {
  final Widget child;
  const RepositoryManager({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [RepositoryProvider<AuthRepository>(create: (context) => FirebaseAuthRepository())],
        child: Builder(builder: (context) {
          return child;
        }));
  }
}
