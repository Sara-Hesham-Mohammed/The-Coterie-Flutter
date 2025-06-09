import 'package:flutter/material.dart';

class IconChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  const IconChip({super.key, required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label), avatar: CircleAvatar(child: Icon(icon),),);
  }
}
