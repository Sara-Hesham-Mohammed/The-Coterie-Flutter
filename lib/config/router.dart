import 'package:flutter/material.dart';
import 'package:the_coterie/view/screens/landing_page.dart';
import '../model/entities/Event.dart';
import '../view/screens/friends_list.dart';
import '../view/screens/home_page.dart';
import '../view/screens/profile_page.dart';
import '../view/screens/single_event_page.dart';
import '../view/screens/log_in.dart';
import 'package:the_coterie/view/screens/favorites_page.dart';
import 'package:the_coterie/view/screens/sign_up.dart';
import '../utils/skeleton.dart';
import '../view/screens/onboarding_page.dart';

class RouteGenerator {
  static MaterialPageRoute buildRoute(
      String currentRouteName, Widget childWidget, bool addBottomNav) {
    return addBottomNav
        ? MaterialPageRoute(
      builder: (context) => Skeleton(
        currentRoute: currentRouteName,
        bodyWidget: childWidget,
      ),
    )
        : MaterialPageRoute(
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
      case '/event':
        if(args is Event) {
          return buildRoute('/event', EventPage(event: args), true);
        } else {
          return _errorRoute();
        }
      case '/profile':
        return buildRoute('/profile', ProfilePage(), true);
      case '/favorites':
        return buildRoute('/favorites', FavoriteEventsPage(), true);
      case '/friends-list':
        return buildRoute('/friends-list', FriendsListPage(), true);
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No route defined for ${settings.name}'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Fixed: Use correct route name
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text('Go to Onboarding'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Fixed: Use correct context and add safety check
                      if (Navigator.canPop(context)) {
                        Navigator.of(context).pop();
                      } else {
                        // If can't pop, navigate to home or onboarding
                        Navigator.pushReplacementNamed(context, '/');
                      }
                    },
                    child: Text('Go back'),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
          // AppBar automatically adds back button, but we can customize its behavior
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ERROR'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.pushReplacementNamed(context, '/');
                  }
                },
                child: Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    });
  }
}