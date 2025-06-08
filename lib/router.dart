import 'package:flutter/material.dart';
import 'package:the_coterie/view/browse_page.dart';
import 'package:the_coterie/view/landing_page.dart';
import 'package:the_coterie/view_models/EventViewModel.dart';
import 'package:the_coterie/utils/skeleton.dart';
import '../view/home_page.dart';
import '../view/single_event_page.dart';
import '../view/log_in.dart';
import '../view/profile_page.dart';
import 'package:the_coterie/view/favorites_page.dart';
import 'package:the_coterie/view/sign_up.dart';
import 'view/onboarding_page.dart';

class RouteGenerator {
  static MaterialPageRoute buildRoute(
      String currentRouteName, Widget childWidget, bool addBottomNav) {
    return addBottomNav? MaterialPageRoute(
      builder: (context) => Skeleton(
        currentRoute: currentRouteName,
        bodyWidget: childWidget,
      ),
    ): MaterialPageRoute(
      builder: (context) => childWidget,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return buildRoute('/', OnboardingPage(), false);
      case '/login':
        return buildRoute('/login', LogInPage(), false);
      case '/signup':
        return buildRoute('/signup', SignUp(), false);
      case '/landing':
        return buildRoute('/landing', LandingPageView(), false);
      case '/home':
        return buildRoute('/home', HomePage(), true);
      case '/browse':
        if (args is EventViewModel) {
          return buildRoute(
              '/browse',
              BrowseSection(
                viewModel: args,
              ), true);
        } else {
          return _errorRoute();
        }

      case '/event':
        return buildRoute('/event', EventPage(), true);
      case '/profile':
        return buildRoute('/profile', ProfilePage(), true);
      case '/favorites':
        return buildRoute('/favorites', FavoriteEventsPage(), true);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No route defined for ${settings.name}'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(_, '/onboarding');
                    },
                    child: Text('Go to Onboarding'),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
