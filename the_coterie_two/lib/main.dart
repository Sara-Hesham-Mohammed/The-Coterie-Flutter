import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_coterie/view/pages/onboarding_page.dart';
import 'package:the_coterie/view/pages/browse_page.dart';
import 'package:the_coterie/view/pages/event_page.dart';
import 'package:the_coterie/view/pages/profile_page.dart';
import 'package:the_coterie/view/pages/saved_events_page.dart';
import 'package:the_coterie/view_models/BottomNavProvider.dart';
import 'package:the_coterie/widgets/bottom_nav.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'firebase_sign_up.dart';

// ...


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );//initializes the firebase APP itself (not the DB)

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: MaterialApp(
        title: 'The Coterie App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child:SignUp(),
            ),
          ),
        ),

      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Widget> _widgetOptions = [
    SavedEventsPage(),
    BrowseSection(),
    ProfilePage(),
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
