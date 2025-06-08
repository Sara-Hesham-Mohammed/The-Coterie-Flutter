import 'package:flutter/material.dart';

class FormButton extends StatefulWidget {
  final String text;
  final GlobalKey<FormState> formKey;
  const FormButton({super.key, required this.text, required this.formKey});

  @override
  State<FormButton> createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      foregroundColor: Colors.white,
    );

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: style,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () {
          if (widget.formKey.currentState?.validate() ?? false) {
            /// do something
          }
        },
      ),
    );
  }
} 