import 'package:flutter/material.dart';
import 'package:the_coterie/widgets/skeleton.dart';

class FavoriteEventsPage extends StatelessWidget {
  const FavoriteEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(bodyWidget: Placeholder(), showAppBars: true, txt: "Favorites",);
  }
}
