import 'package:flutter/cupertino.dart';
import 'package:futureproof/screens/form_completed_screen.dart';
import 'package:futureproof/screens/form_farmer_screen.dart';
import 'package:futureproof/screens/form_root_screen.dart';
import 'package:futureproof/screens/finances_screen.dart';
import 'package:futureproof/screens/form_worker_screen.dart';
import 'package:futureproof/screens/home_screen.dart';
import 'package:futureproof/screens/login_screen.dart';
import 'package:futureproof/screens/progress_screen.dart';
import 'package:futureproof/screens/recommendations_screen.dart';
import 'package:futureproof/screens/register_screen.dart';
import 'package:futureproof/screens/welcome_screen.dart';

List<String> routeNames = [
  HomeScreen.id,
  LoginScreen.id,
  RegisterScreen.id,
  WelcomeScreen.id,
  ProgressScreen.id,
  FormRootScreen.id,
  RecommendationsScreen.id,
  FinancesScreen.id,
];

Map<String, Widget Function(BuildContext)> routesMap = {
  HomeScreen.id: (context) => HomeScreen(),
  LoginScreen.id: (context) => LoginScreen(),
  RegisterScreen.id: (context) => RegisterScreen(),
  WelcomeScreen.id: (context) => WelcomeScreen(),
  ProgressScreen.id: (context) => ProgressScreen(),
  FormRootScreen.id: (context) => FormRootScreen(),
  FormFarmerScreen.id: (context) => FormFarmerScreen(),
  FormWorkerScreen.id: (context) => FormWorkerScreen(),
  FormCompletedScreen.id: (context) => FormCompletedScreen(),
  RecommendationsScreen.id: (context) => RecommendationsScreen(),
  FinancesScreen.id: (context) => FinancesScreen(),

};

Map<String, String> displayNamesMap = {
  HomeScreen.id: HomeScreen.displayName,
  LoginScreen.id: LoginScreen.displayName,
  RegisterScreen.id: RegisterScreen.displayName,
  WelcomeScreen.id: WelcomeScreen.displayName,
  ProgressScreen.id: ProgressScreen.displayName,
  FormRootScreen.id: FormRootScreen.displayName,
  FormFarmerScreen.id: FormFarmerScreen.displayName,
  FormWorkerScreen.id: FormWorkerScreen.displayName,
  RecommendationsScreen.id: RecommendationsScreen.displayName,
  FinancesScreen.id: FinancesScreen.displayName,
};