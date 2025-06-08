import 'package:flutter/material.dart';

class SecondaryButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressedFn;
  const SecondaryButton({super.key, required this.text, this.onPressedFn});

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: Theme.of(context).textTheme.labelLarge,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
    );

    return ElevatedButton(
        style: style, onPressed: widget.onPressedFn, child: Text(widget.text));
  }
}
