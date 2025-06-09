import 'package:flutter/material.dart';

import '../atoms/interest_w_icon.dart';

class ProfileInterests extends StatelessWidget {
  const ProfileInterests({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40.0, // Horizontal space between chips
      runSpacing: 4.0, // Vertical space between chips
      children: [
        IconChip(
          label: 'Music',
          icon: Icons.music_note_rounded,
        ),
        IconChip(
          label: 'Art',
          icon: Icons.brush_rounded,
        ),
        IconChip(
          label: 'Technology',
          icon: Icons.computer_rounded,
        ),
        IconChip(
          label: 'Sports',
          icon: Icons.sports_rounded,
        ),
      ],
    );
  }
}
