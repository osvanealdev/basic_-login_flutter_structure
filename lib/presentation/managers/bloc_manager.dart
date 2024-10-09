import 'package:app_remision/domain/repository/auth_repository.dart';
import 'package:app_remision/presentation/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitBlocManager extends StatelessWidget {
  final Widget child;
  const CubitBlocManager({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AuthCubit(context.read<AuthRepository>()),
      )
    ], child: child);
  }
}
