import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coterie/view/widgets/atoms/consumer_button.dart';
import 'package:the_coterie/view/widgets/atoms/form_text_field.dart';
import '../../utils/msg_snackbar.dart';
import '../../view_models/auth_cubit/auth_cubit_cubit.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Text(
              "Create Account",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Join our community today",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const SignUpForm(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  // Custom validator for non-email fields
  String? _defaultValidator(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $fieldName';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InputField(
                  controller: firstNameController,
                  type: 'First Name',
                  typeIcon: const Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: InputField(
                  controller: lastNameController,
                  type: 'Last Name',
                  typeIcon: const Icon(Icons.person_outline),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          InputField(
            controller: emailController,
            type: 'Email',
            typeIcon: const Icon(Icons.email_outlined),
          ),
          const SizedBox(height: 16),
          InputField(
            controller: phoneController,
            type: 'Phone Number',
            typeIcon: const Icon(Icons.phone_outlined),
          ),
          const SizedBox(height: 16),
          PasswordField(
            controller: passwordController,
          ),
          const SizedBox(height: 16),
          // Custom confirm password field using PasswordField as base
          TextFormField(
            controller: confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
              hintText: 'Confirm your password',
              prefixIcon: Icon(Icons.lock_outline_rounded),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          BlockAuthConsumer(
            pageRoute: '/landing',
            cubit: cubit,
            handlerFunction: () {
              if (_formKey.currentState!.validate()) {
                // Additional manual validation for non-email fields
                if (firstNameController.text.isEmpty) {
                  SnackBarUtils.showSnackBar(context, 'Please enter your first name');
                  return;
                }
                if (lastNameController.text.isEmpty) {
                  SnackBarUtils.showSnackBar(context, 'Please enter your last name');
                  return;
                }
                if (phoneController.text.isEmpty) {
                  SnackBarUtils.showSnackBar(context, 'Please enter your phone number');
                  return;
                }

                SnackBarUtils.showSnackBar(context, 'Creating your account...');
                cubit.signUp(
                  emailController.text,
                  passwordController.text,
                  // Add additional parameters if your cubit supports them
                  // firstName: firstNameController.text,
                  // lastName: lastNameController.text,
                  // phone: phoneController.text,
                );
              }
            },
            btnText: 'Sign Up',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'OR',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            icon: const Icon(Icons.g_mobiledata, size: 24),
            label: const Text('Continue with Google'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              // Handle Google sign in
            },
          ),
        ],
      ),
    );
  }
}