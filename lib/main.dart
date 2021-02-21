import 'package:flutter/material.dart';
import 'package:futureproof/screens/data_form_screen.dart';
import 'package:futureproof/screens/finances_screen.dart';
import 'package:futureproof/screens/home_screen.dart';
import 'package:futureproof/screens/login_screen.dart';
import 'package:futureproof/screens/menu_screen.dart';
import 'package:futureproof/screens/progress_screen.dart';
import 'package:futureproof/screens/recommendations_screen.dart';
import 'package:futureproof/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:'/',
      routes: {
        '/': (context) => HomeScreen(),
        '/menu': (context) => MenuScreen(),
        '/login': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/progress': (context) => ProgressScreen(),
        '/data_form': (context) => DataFormScreen(),
        '/recommendations': (context) => RecommendationsScreen(),
        '/finances': (context) => FinancesScreen(),
      },
    );
  }
}