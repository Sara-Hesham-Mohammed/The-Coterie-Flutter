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
