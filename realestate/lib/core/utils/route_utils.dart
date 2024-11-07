import 'package:flutter/material.dart';
import 'package:realestate/features/home_interface/screen/HomeScreen.dart';
import 'package:realestate/features/onboarding/screen/OnboardingScreen.dart';

class RouteUtils {
  static const String welcomeScreen = '/welcome';
  static const String homeScreen = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
    }
  }
}
