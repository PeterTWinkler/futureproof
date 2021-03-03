import 'package:flutter/cupertino.dart';
import 'package:futureproof/screens/data_form_screen.dart';
import 'package:futureproof/screens/finances_screen.dart';
import 'package:futureproof/screens/home_screen.dart';
import 'package:futureproof/screens/login_screen.dart';
import 'package:futureproof/screens/progress_screen.dart';
import 'package:futureproof/screens/recommendations_screen.dart';
import 'package:futureproof/screens/welcome_screen.dart';

List<String> routeNames = [
  HomeScreen.id,
  LoginScreen.id,
  WelcomeScreen.id,
  ProgressScreen.id,
  DataFormScreen.id,
  RecommendationsScreen.id,
  FinancesScreen.id,
];

Map<String, Widget Function(BuildContext)> routesMap = {
  HomeScreen.id: (context) => HomeScreen(),
  LoginScreen.id: (context) => LoginScreen(),
  WelcomeScreen.id: (context) => WelcomeScreen(),
  ProgressScreen.id: (context) => ProgressScreen(),
  DataFormScreen.id: (context) => DataFormScreen(),
  RecommendationsScreen.id: (context) => RecommendationsScreen(),
  FinancesScreen.id: (context) => FinancesScreen(),
};

Map<String, String> displayNamesMap = {
  HomeScreen.id: HomeScreen.displayName,
  LoginScreen.id: LoginScreen.displayName,
  WelcomeScreen.id: WelcomeScreen.displayName,
  ProgressScreen.id: ProgressScreen.displayName,
  DataFormScreen.id: DataFormScreen.displayName,
  RecommendationsScreen.id: RecommendationsScreen.displayName,
  FinancesScreen.id: FinancesScreen.displayName,
};