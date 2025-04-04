import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  const PrimaryButton({super.key, required this.text});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Colors.white,
    );
    return ElevatedButton(
        style: style, onPressed: () {}, child: Text(widget.text));
  }
}

class SecondaryButton extends StatefulWidget {
  final String text;
  const SecondaryButton({super.key, required this.text});

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      foregroundColor: Colors.white,
    );

    return ElevatedButton(
        style: style, onPressed: () {}, child: Text(widget.text));
  }
}


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
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)),
        ),
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
