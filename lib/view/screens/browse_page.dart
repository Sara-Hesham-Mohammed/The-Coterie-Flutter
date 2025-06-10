import 'package:flutter/material.dart';
import 'package:the_coterie/view/widgets/event_card.dart';
import 'package:the_coterie/view/widgets/search_bar.dart';
import 'package:the_coterie/view_models/event_view_model.dart';

class BrowseSection extends StatelessWidget {
  const BrowseSection({super.key});

  @override
  Widget build(BuildContext context) {

    final EventViewModel viewModel = EventViewModel();
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
            listenable: viewModel,
            builder: (context, _) {
              return Column(
                children: [
                  Search(),
                  Text("Browse"),
                  Container(
                    height: 125,
                    color: Colors.blueAccent,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.events.length,
                        itemBuilder: (BuildContext context, int index) =>
                            EventCard(event: viewModel.events[index])),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
