import 'package:flutter/material.dart';
import 'package:the_coterie/widgets/event_card.dart';
import 'package:the_coterie/widgets/skeleton.dart';

class ComponentPage extends StatelessWidget {
  const ComponentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(showAppBars: true,bodyWidget: ComponentContent(), txt: "Event Page (pass event name)");
  }
}

class ComponentContent extends StatelessWidget {
  ComponentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: EventCard(),
    );
  }
}
