import 'package:app_remision/presentation/auth/cubit/auth_cubit.dart';
import 'package:app_remision/presentation/auth/loading_screen.dart';
import 'package:app_remision/presentation/auth/login/login_screen.dart';
import 'package:app_remision/presentation/auth/signUp/signup_screen.dart';
import 'package:app_remision/presentation/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterConfiguration {
  static final GoRouter routerConfig = GoRouter(
    initialLocation: LoadingScreen.path,
    routes: [
      GoRoute(
        path: SignUpScreen.path,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: HomeScreen.path,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: LoadingScreen.path,
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: LoginScreen.path,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
    redirect: (context, state) async {
      final goingTo = state.matchedLocation;
      final AuthState authState = context.read<AuthCubit>().state;
      if (authState is AuthUnauthenticated &&
          goingTo != SignUpScreen.path &&
          goingTo != LoginScreen.path &&
          goingTo != LoadingScreen.path) {
        return LoginScreen.path;
      } else {
        return null;
      }
    },
  );
}
