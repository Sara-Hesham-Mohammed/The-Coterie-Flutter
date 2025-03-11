import 'package:flutter/material.dart';
import '../../widgets/button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Placeholder(), ButtonGroup(), Text("skip sign up >")]);
  }
}

class ButtonGroup extends StatefulWidget {
  const ButtonGroup({super.key});

  @override
  State<ButtonGroup> createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PrimaryButton(text: "Sign Up"),
          SecondaryButton(text: "Log In")
        ],
      ),
    );
  }
}
