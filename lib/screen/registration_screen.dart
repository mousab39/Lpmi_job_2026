import 'package:flutter/material.dart';
import 'package:lpmi/conponent/custom_button.dart';
import 'package:lpmi/controller/registration_controller.dart';
import 'package:lpmi/screen/login_screen.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final regController =
    Provider.of<RegistrationController>(context, listen: false);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Inscription"),

              TextField(
                controller: regController.nomController,
                decoration: const InputDecoration(
                  labelText: "Nom",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: regController.prenomController,
                decoration: const InputDecoration(
                  labelText: "Prénom",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: regController.emailController,
                decoration: const InputDecoration(
                  labelText: "E-mail",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: regController.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Mot de passe",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),

              CustomButton(
                elevatedButtonText: "S'inscrire",
                textButtonText: "Déjà un compte ? Se connecter",

                elevatedButtonClicked: () {
                  regController.checkRegistration().then((ok) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          ok
                              ? 'Registration Successful'
                              : 'Registration Failed',
                        ),
                      ),
                    );
                  });
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
      ),
    );
  }
}
