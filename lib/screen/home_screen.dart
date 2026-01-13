import 'package:flutter/material.dart';
import 'package:lpmi/conponent/custom_offer.dart';
import 'package:lpmi/controller/home_controller.dart';
import 'package:lpmi/model/offer.dart';
import 'package:lpmi/screen/add_offer_screen.dart';
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
      appBar: AppBar(title: const Text("offres dispos"), centerTitle: true),
      body: ListView.builder(
        itemCount: homeController.offers.length,
        itemBuilder: (context, index) {
          final offer = homeController.offers[index];

          return Row(
            children: [
              Expanded(child: CustomOffer(offer: offer)),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () async {
                  final updatedOffer = await Navigator.push<Offer>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddOfferScreen(offer: offer),
                    ),
                  );
                  if (updatedOffer != null) {
                    homeController.updateOffer(updatedOffer);
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  homeController.deleteOffer(offer.id);
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddOfferScreen()),
          );
        },
        tooltip: "ajouter une offre",
        child: const Icon(Icons.add),
      ),
    );
  }
}
