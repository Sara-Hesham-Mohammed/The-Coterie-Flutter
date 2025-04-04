import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_coterie/view/pages/onboarding_page.dart';
import 'package:the_coterie/view/pages/browse_page.dart';
import 'package:the_coterie/view/pages/event_page.dart';
import 'package:the_coterie/view/pages/profile_page.dart';
import 'package:the_coterie/view/pages/saved_events_page.dart';
import 'package:the_coterie/view_models/BottomNavProvider.dart';
import 'package:the_coterie/widgets/BottomNav.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:the_coterie/view/pages/LogIn.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _widgetOptions = [
    SavedEventsPage(),
    BrowseSection(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    //init whatever is needed for the app here
    FlutterNativeSplash.remove();
  }


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
            child: SignInPage(),
            //child: _widgetOptions[bottomNavProvider.selectedIndex],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),

    );
  }
}
