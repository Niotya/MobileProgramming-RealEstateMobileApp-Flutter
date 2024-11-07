import 'package:flutter/material.dart';
import '../screen/OnboardingScreen.dart';
import 'package:realestate/core/features/onboarding/screen/WelcomeScreen.dart'; // Import the new WelcomeScreen

class OnboardingController extends ChangeNotifier {
  int _currentStep = 0;

  // Getter for current step
  int get currentStep => _currentStep;

  // Method to go to the next step
  void nextStep(BuildContext context) {
    if (_currentStep < onboardingSteps.length - 1) {
      _currentStep++;
      notifyListeners();
    } else {
      // Navigate to HomeScreen if it's the last step
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  // Method to go to the previous step or skip onboarding
  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  // Directly update the current step
  void updateCurrentStep(int step) {
    if (step >= 0 && step < onboardingSteps.length) {
      _currentStep = step;
      notifyListeners();
    }
  }

  // List of onboarding screens
  List<Widget> onboardingSteps = [
    OnboardingScreen(), // Second onboarding step
    // Add more screens if needed
  ];
}
