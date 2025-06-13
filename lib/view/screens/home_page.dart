import 'package:flutter/material.dart';
import 'package:the_coterie/view/widgets/event_card.dart';
import 'package:the_coterie/view/widgets/search_bar.dart';
import 'package:the_coterie/view_models/event_view_model.dart';

import '../widgets/molecules/tabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final EventViewModel viewModel = EventViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadEvents();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
            listenable: viewModel,
            builder: (context, _) {
              return Column(
                children: [
                  // Search(),
                  Expanded(child: Tabs()),
                  Container(
                    height: 125,
                    color: Colors.blueAccent,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.events.length,
                          itemBuilder: (BuildContext context, int index) =>
                              EventCard(event: viewModel.events[index])),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
