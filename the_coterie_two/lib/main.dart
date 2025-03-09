import 'package:flutter/material.dart';
import 'package:the_coterie/view/pages/event_page.dart';
import 'package:the_coterie/view/pages/landing_page.dart';
import 'package:the_coterie/view/pages/browse_page.dart';
import 'package:the_coterie/widgets/BottomNav.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Coterie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home:  Scaffold(
          body: SafeArea(child: LandingPageView()),
        bottomNavigationBar: BottomNavBar(),
      ),
    
    
    );
  }
}