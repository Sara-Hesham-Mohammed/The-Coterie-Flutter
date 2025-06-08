import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coterie/view/widgets/atoms/consumer_button.dart';
import 'package:the_coterie/view/widgets/atoms/checkbox_list_item.dart';
import 'package:the_coterie/view/widgets/atoms/form_text_field.dart';
import '../../utils/msg_snackbar.dart';
import '../../view_models/auth_cubit/auth_cubit_cubit.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        body: Center(
            child: isSmallScreen
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _LogoImage(),
                      const _FormContent(),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.all(32.0),
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Row(
                      children: const [
                        Expanded(child: _LogoImage()),
                        Expanded(
                          child: Center(child: _FormContent()),
                        ),
                      ],
                    ),
                  )));
  }
}

class _LogoImage extends StatelessWidget {
  const _LogoImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250, // Set your desired width
      height: 250, // Set your desired height
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Image.asset(
          'assets/welc-logo.png',
          fit: BoxFit.contain, // Use 'contain' to keep proportions
        ),
      ),
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent();

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _rememberMe = CheckBoxListItem(text: 'Remember me');

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              type: 'Email',
              typeIcon: Icon(Icons.email_outlined),
              controller: emailController,
            ),
            _gap(),
            PasswordField(
              controller: passwordController,
            ),
            _gap(),
            BlockAuthConsumer(
              handlerFunction: () {
                if (_formKey.currentState!.validate()) {
                  final email = emailController.text;
                  final password = passwordController.text;

                  cubit.signIn(
                    email,
                    password,
                    rememberMe: _rememberMe.isChecked,
                  );
                  SnackBarUtils.showSnackBar(context, 'Logging in...');
                } else {
                  SnackBarUtils.showSnackBar(
                      context, 'Error logging in! Please try again.');
                }
              },
              cubit: cubit,
              btnText: 'Log in',
            ),
            _gap(),
            _rememberMe,
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
