import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_coterie/routes.dart';

import 'core/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Coterie',
      theme: buildAppTheme(),
      initialRoute: '/',
      onGenerateRoute: (RouteGenerator.generateRoute),
    );
  }
}
