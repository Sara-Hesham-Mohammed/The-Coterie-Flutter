import 'package:flutter/material.dart';

import '../../../view_models/event_view_model.dart';
import '../event_card.dart';
import '../../../utils/msg_snackbar.dart';

class Tabs extends StatelessWidget {
  final EventViewModel viewModel;
  const Tabs({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Explore'),
                Tab(text: 'For You'),
              ],
              indicatorColor: Theme.of(context)
                  .colorScheme
                  .secondary, // Customize the indicator color
              labelColor: Theme.of(context)
                  .colorScheme
                  .secondary, // Customize the selected tab text color
              unselectedLabelColor:
                  Colors.grey, // Customize unselected tab text color
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  //tab 1
                  SizedBox(
                    child: Container(
                      height: 125,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          try {
                            SnackBarUtils.showSnackBar(context, "pulled");
                            await viewModel.loadEvents();
                          } catch (e) {
                            print('Refresh error: $e');
                            // Show user-friendly error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Failed to refresh: ${e.toString()}')),
                            );
                          }
                          throw 'Refresh Error';
                        },
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: viewModel.events.length,
                            itemBuilder: (BuildContext context, int index) =>
                                EventCard(event: viewModel.events[index])),
                      ),
                    ),
                  ),
                  // tab 2
                  ListView(
                    children: [
                      Center(child: Placeholder()),
                      Center(child: Placeholder()),
                      Center(child: Placeholder()),
                      Center(child: Placeholder()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
