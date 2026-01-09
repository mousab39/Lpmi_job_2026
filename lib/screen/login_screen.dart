import 'package:flutter/material.dart';
import 'package:lpmi/conponent/custom_button.dart';
import 'package:lpmi/controller/login_controller.dart';
import 'package:lpmi/screen/home_screen.dart';
import 'package:lpmi/screen/registration_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(
      context,
      listen: false,
    );

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Connexion"),

              TextField(
                controller: loginController.emailController,
                decoration: const InputDecoration(
                  labelText: "E-mail",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),

              TextField(
                controller: loginController.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Mot de passe",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),

              CustomButton(
                elevatedButtonText: "Se connecter",
                textButtonText: "Pas de compte ? S'inscrire",

                elevatedButtonClicked: () {
                  loginController.checkLogin().then((ok) {
                    if (ok) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login Failed')),
                      );
                    }
                  });
                },

                textButtonClicked: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
