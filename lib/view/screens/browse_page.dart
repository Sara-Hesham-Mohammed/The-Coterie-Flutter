import 'package:flutter/material.dart';
import 'package:the_coterie/view/widgets/event_card.dart';
import 'package:the_coterie/view/widgets/search_bar.dart';
import 'package:the_coterie/view_models/EventViewModel.dart';

class BrowseSection extends StatelessWidget {
  final EventViewModel viewModel;
  const BrowseSection({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
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
