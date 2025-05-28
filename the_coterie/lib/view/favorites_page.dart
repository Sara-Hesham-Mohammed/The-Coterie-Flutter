import 'package:flutter/material.dart';
import 'package:the_coterie/widgets/skeleton.dart';

class FavoriteEventsPage extends StatelessWidget {
  const FavoriteEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("FAVOURITES"),
        const SizedBox(height: 20),
        Placeholder(),
      ],
    );
  }
}
