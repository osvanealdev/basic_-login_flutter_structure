import 'package:app_remision/presentation/auth/cubit/auth_cubit.dart';
import 'package:app_remision/presentation/auth/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const path = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(path),
            ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().signOut();
                  context.pushReplacement(LoadingScreen.path);
                },
                child: const Text('LOGOUT'))
          ],
        ),
      ),
    );
  }
}
