import 'package:flutter/material.dart';
import 'package:the_coterie/widgets/skeleton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(bodyWidget: Placeholder(), showAppBars: true,txt: "Home",);
  }
}
