import 'package:einventorycomputer/modules/authentication/screen/login.dart';
import 'package:einventorycomputer/modules/home/screen/screen.dart';
import 'package:einventorycomputer/modules/home/screen/test.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Poppins'),
          bodyMedium: TextStyle(fontFamily: 'Poppins'),
          displayLarge: TextStyle(fontFamily: 'Poppins'), 
          displayMedium: TextStyle(fontFamily: 'Poppins'),
        ),
      ),

 

      //home: const LoginPage(),
      home: ScreenPage(),

      // home: RevenueScreen(),

    );
  }
}
