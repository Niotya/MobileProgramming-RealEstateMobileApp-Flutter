import 'package:flutter/material.dart';
import 'package:realestate/core/constants/image_constants.dart';
import 'package:realestate/core/utils/route_utils.dart';
import 'package:realestate/core/utils/storage_utils.dart';

// Define OnboardingContent first
class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;
  final String? imagePath;

  OnboardingContent({
    required this.title,
    required this.description,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(flex: 2),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.5,
            letterSpacing: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 1),
        if (imagePath != null)
          Image.asset(
            imagePath!,
            height: 200,
            fit: BoxFit.contain,
          ),
        Spacer(flex: 3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              height: 1.5,
              letterSpacing: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}

// Main OnboardingScreen widget
class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Perfect Choice for Your Future Living',
      'description': 'Our properties are the masterpiece with every client with master value, top notch corporation.',
    },
    {
      'title': 'Discover Amazing Features',
      'description': 'Our app offers a variety of features designed to make your experience seamless and enjoyable.',
    },
    {
      'title': 'Quick Guide',
      'description': 'Here are some quick tips to help you get started smoothly.',
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  void _completeOnboarding() async {
    await StorageUtils.setOnboardingCompleted(true);
    Navigator.pushReplacementNamed(context, RouteUtils.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImageConstants.welcomeIllustration,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: onboardingData.length,
                    itemBuilder: (context, index) {
                      return OnboardingContent(
                        title: onboardingData[index]['title']!,
                        description: onboardingData[index]['description']!,
                        imagePath: onboardingData[index]['imagePath'],
                      );
                    },
                  ),
                ),
                // Dot indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => buildDot(index),
                  ),
                ),
                SizedBox(height: 24),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip Button with outline style
                    OutlinedButton(
                      onPressed: _skipOnboarding,
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    // Continue Button with filled style
                    ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.black, // Updated to backgroundColor
                      ),
                      child: Text(
                        _currentPage == onboardingData.length - 1 ? 'Get Started' : 'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Dot builder for progress indicator
  Widget buildDot(int index) {
    return Container(
      height: 10,
      width: _currentPage == index ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
