import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coterie/widgets/form_text_field.dart';

import '../cubit/auth_cubit_cubit.dart';
import '../cubit/auth_cubit_state.dart';
import '../widgets/button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Sign Up", style: Theme.of(context).textTheme.headlineMedium),
        SignUpForm(),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ],
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid - can access the values
      showSnackBar('Form is valid! Processing...');

      // submit the form data to neo4j
      print('Form submitted successfully!');
      showSnackBar('Form submitted successfully!');
    } else {
      // Form has validation errors
      showSnackBar('Error submitting form! Please try again.');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final cubit = BlocProvider.of<AuthCubit>(context);

    return Form(
      child: Column(
        children: [
          InputField(
            controller: emailController,
            type: 'Email',
            typeIcon: Icon(Icons.mail),
          ),
          PasswordField(
            controller: passwordController,
          ),
          const SizedBox(height: 20),
          BlockAuthConsumer(
            cubit: cubit,
            handleSignUp: () => {
              if (_formKey.currentState!.validate())
                {cubit.signUp(emailController.text, passwordController.text)}
            },
          ),
        ],
      ),
    );
  }
}

class BlockAuthConsumer extends StatelessWidget {
  final AuthCubit cubit;
  final VoidCallback handleSignUp;
  const BlockAuthConsumer({
    super.key,
    required this.cubit,
    required this.handleSignUp,
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
            Navigator.of(context).pushNamed('/home');
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
              text: '',
              // Could add loading indicator here
            ),
          _ => PrimaryButton(
              text: 'Sign Up',
              onPressedFn: handleSignUp,
            ),
        };
      },
    );
  }
}
