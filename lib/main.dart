import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coterie/config/router.dart';
import 'package:the_coterie/view_models/auth_cubit/auth_cubit_cubit.dart';
import 'package:the_coterie/view_models/auth_cubit/auth_cubit_state.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config/app_theme.dart';

Future<void> main() async {
  await initializeApp();
  runApp(const MyApp());
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) {
            final cubit = AuthCubit();
            // Check auth state when app starts
            cubit.checkAuth();
            return cubit;
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'The Coterie',
                theme: buildAppTheme(),
                initialRoute: _getInitialRoute(state),
                onGenerateRoute: RouteGenerator.generateRoute,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }

  String _getInitialRoute(AuthState state) {
    switch (state.runtimeType) {
      case Authenticated:
        return '/home';  // Go directly to home if authenticated
      case Unauthenticated:
        return '/';      // Go to onboarding/landing if not authenticated
      case AuthLoading:
      case AuthInitial:
      default:
        return '/';      // Default to onboarding while loading
    }
  }
}