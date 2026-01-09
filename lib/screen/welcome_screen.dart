import 'package:flutter/material.dart';
import 'package:lpmi/screen/login_screen.dart';
import 'package:lpmi/screen/registration_screen.dart';
import 'package:lpmi/conponent/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/ube.jpg", width: 100),
            const SizedBox(height: 50),
            const Text("Bienvenue sur l'app LPMI"),
            const SizedBox(height: 50),

            CustomButton(
              elevatedButtonText: "S'inscrire",
              textButtonText: "Se connecter",

              elevatedButtonClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrationScreen(),
                  ),
                );
              },

              textButtonClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
