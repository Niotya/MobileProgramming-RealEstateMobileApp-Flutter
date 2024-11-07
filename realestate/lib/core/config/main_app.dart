import 'package:flutter/material.dart';
// ignore: unused_import
import '../features/onboarding/screen/WelcomeScreen.dart';
import '../utils/route_utils.dart';

// ignore: use_key_in_widget_constructors
class AplikasiSaya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Rumah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RouteUtils.welcomeScreen,
      onGenerateRoute: RouteUtils.generateRoute,
    );
  }
}
