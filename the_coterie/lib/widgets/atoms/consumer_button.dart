import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coterie/widgets/atoms/primary_button.dart';

import '../../view_models/auth_cubit/auth_cubit_cubit.dart';
import '../../view_models/auth_cubit/auth_cubit_state.dart';

class BlockAuthConsumer extends StatelessWidget {
  final AuthCubit cubit;
  final VoidCallback handlerFunction;
  final String btnText;

  const BlockAuthConsumer({
    super.key,
    required this.cubit,
    required this.handlerFunction, required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: cubit,

      // Listen only to success and error states
      listenWhen: (previous, current) =>
      current is Authenticated || current is AuthError,

      listener: (context, state) {
        switch (state) {
          case Authenticated():
            Navigator.of(context).pushNamed('/landing');
            break;
          case AuthError():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            break;
        }
      },

      // Rebuild for loading, error, and success states
      buildWhen: (previous, current) =>
      current is AuthLoading ||
          current is AuthError ||
          current is Authenticated,

      builder: (context, state) {
        return switch (state) {
          AuthLoading() => const PrimaryButton(
            text: 'loading...',
            // Could add loading indicator here
          ),
          _ => PrimaryButton(
            text: btnText,
            onPressedFn: handlerFunction,
          ),
        };
      },
    );
  }
}
