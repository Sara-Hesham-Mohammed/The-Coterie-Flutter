import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import 'countdown.dart';

class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    return Container(
      padding: EdgeInsets.all(25),
      width: res.wp(80),
      height: res.hp(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Coterie Coming Soon",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondary, // or any color you want
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            CountdownWidget(
              targetDate: DateTime(2025, 6, 16, 11, 40, 00),
              onTimerEnd: (){

              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "The algorithm whisperer is working its quiet magic… your coterie is on the way.",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontStyle: FontStyle.italic),
            )
          ]),
    );
  }
}
