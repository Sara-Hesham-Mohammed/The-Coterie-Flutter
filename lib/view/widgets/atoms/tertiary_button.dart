import 'package:flutter/material.dart';

class TertiaryButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressedFn;
  const TertiaryButton({super.key, required this.text, this.onPressedFn});

  @override
  State<TertiaryButton> createState() => _TertiaryButtonState();
}

class _TertiaryButtonState extends State<TertiaryButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: Theme.of(context).textTheme.labelLarge,
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
    );

    return ElevatedButton(
        style: style, onPressed: widget.onPressedFn, child: Text(widget.text));
  }
} 