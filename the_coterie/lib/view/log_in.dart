import 'package:flutter/material.dart';
import 'package:the_coterie/widgets/button.dart';
import 'package:the_coterie/widgets/form_text_field.dart';

import '../../widgets/checkbox_list_item.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

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
  const _LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Set your desired width
      height: 250, // Set your desired height
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Image.asset('assets/welc-logo.png',
          fit: BoxFit.contain, // Use 'contain' to keep proportions
        ),
      ),
    );

  }
}

class _FormContent extends StatefulWidget {
  const _FormContent({Key? key}) : super(key: key);

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           InputField(type: 'Email', typeIcon: Icon(Icons.email_outlined), controller: emailController,),
            _gap(),
            PasswordField(
              controller: passwordController,
            ),
            _gap(),
            CheckBoxListItem(text: 'Remember me',),
            _gap(),
            FormButton(text: 'Log in', formKey: _formKey),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
