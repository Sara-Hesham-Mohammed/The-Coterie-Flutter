import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_coterie/router.dart';
import 'package:the_coterie/view_models/auth_cubit/auth_cubit_cubit.dart';
import 'package:the_coterie/view_models/auth_cubit/auth_cubit_state.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/app_theme.dart';

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
            cubit.checkAuth();
            return cubit;
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          final authCubit = BlocProvider.of<AuthCubit>(context);

          return BlocBuilder<AuthCubit, AuthState>(
              bloc: authCubit,
              buildWhen: (previous, current) =>
                  current is Authenticated || current is AuthInitial,
              builder: (context, state) {
                return MaterialApp(
                  title: 'The Coterie',
                  theme: buildAppTheme(),
                  initialRoute: '/',
                  onGenerateRoute: (RouteGenerator.generateRoute),
                );
              });
        },
      ),
    );
  }
}
