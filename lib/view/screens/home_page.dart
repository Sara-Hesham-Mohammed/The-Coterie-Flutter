import 'package:flutter/material.dart';
import 'package:the_coterie/view/widgets/event_card.dart';
import 'package:the_coterie/view/widgets/search_bar.dart';
import 'package:the_coterie/view_models/event_view_model.dart';

import '../location_picker.dart';
import '../widgets/location_picker_btn.dart';
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

                  //must be wrapped in expaded (doesnt show otherwise)
                  Expanded(child: Tabs(viewModel: viewModel)),
                ],
              );
            }),
      ),
    );
  }
}
