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
      body: Column(
        children: [
          Text("Sign Up", style: Theme.of(context).textTheme.headlineMedium),
          SignUpForm(),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
        ],
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
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final cubit = BlocProvider.of<AuthCubit>(context);

    return Form(
      key: _formKey,
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
            handlerFunction:(){
              if (_formKey.currentState!.validate()) {
                // Form is valid - can access the values
                SnackBarUtils.showSnackBar(context,'Form is valid! Processing...');
                cubit.signUp(emailController.text, passwordController.text);
                SnackBarUtils.showSnackBar(context,'Form submitted successfully!');
              } else {
                SnackBarUtils.showSnackBar(context,'Error submitting form! Please try again.');
              }
            }, btnText: 'Sign Up',
          ),
        ],
      ),
    );
  }
}
