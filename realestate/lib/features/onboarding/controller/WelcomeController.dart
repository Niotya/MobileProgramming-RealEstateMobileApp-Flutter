import 'package:flutter/material.dart';
import '../screen/OnboardingScreen.dart'; // Step 1 Screen
// Import other onboarding steps as needed

class OnboardingController extends ChangeNotifier {
  int _currentStep = 0;

  int get currentStep => _currentStep;

  void nextStep() {
    if (_currentStep < onboardingSteps.length - 1) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  List<Widget> onboardingSteps = [
    OnboardingScreen(),
    // Add other onboarding screens like TermsScreen(), FeaturesIntroScreen(), etc.
  ];
}
