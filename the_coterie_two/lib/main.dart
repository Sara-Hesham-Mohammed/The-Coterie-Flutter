import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_coterie/view/pages/browse_page.dart';
import 'package:the_coterie/view/pages/profile_page.dart';
import 'package:the_coterie/view_models/BottomNavProvider.dart';
import 'package:the_coterie/widgets/BottomNav.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Widget> _widgetOptions = [
    ProfilePage(),
    BrowseSection(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return MaterialApp(
      title: 'The Coterie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: _widgetOptions[bottomNavProvider.selectedIndex],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
