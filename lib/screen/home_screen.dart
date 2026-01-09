import 'package:flutter/material.dart';
import 'package:lpmi/conponent/custom_offer.dart';
import 'package:lpmi/controller/home_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeController>(context, listen: false).loadOffers();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Offres")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: homeController.offers.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: homeController.offers.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Scaffold(
                      body: Center(child: Text("Page détail offre")),
                    ),
                  ),
                );
              },
              child: CustomOffer(
                offer: homeController.offers[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
