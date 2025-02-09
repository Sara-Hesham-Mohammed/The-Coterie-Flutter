import 'package:flutter/material.dart';

class InterestWidget extends StatelessWidget {
  const InterestWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const textA = Text("interest x");

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          body: Column(children: [
        Container(
          color: Colors.pink[50],
          child: textA,
          margin: const EdgeInsets.all(100),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ])),
    );
  }
}
