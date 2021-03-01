import 'package:flutter/cupertino.dart';
import 'package:futureproof/screens/data_form_screen.dart';
import 'package:futureproof/screens/finances_screen.dart';
import 'package:futureproof/screens/home_screen.dart';
import 'package:futureproof/screens/login_screen.dart';
import 'package:futureproof/screens/progress_screen.dart';
import 'package:futureproof/screens/recommendations_screen.dart';
import 'package:futureproof/screens/welcome_screen.dart';

List<String> routeNames = [
  '/',
  '/login',
  '/welcome',
  '/progress',
  '/data_form',
  '/recommendations',
  '/finances',
];

Map<String, Widget Function(BuildContext)> routesMap = {
  '/': (context) => HomeScreen(),
  '/login': (context) => LoginScreen(),
  '/welcome': (context) => WelcomeScreen(),
  '/progress': (context) => ProgressScreen(),
  '/data_form': (context) => DataFormScreen(),
  '/recommendations': (context) => RecommendationsScreen(),
  '/finances': (context) => FinancesScreen(),
};

//TODO: Add Map for screen display names