import 'package:flutter/material.dart';
import 'package:lpmi/controller/login_controller.dart';
import 'package:lpmi/controller/registration_controller.dart';
import 'package:lpmi/screen/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:lpmi/controller/home_controller.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => RegistrationController()),
        ChangeNotifierProvider(create: (_) => HomeController()),

      ],
      child: MaterialApp(
        title: 'lpmi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
