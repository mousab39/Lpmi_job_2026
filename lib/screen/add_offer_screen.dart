import 'package:flutter/material.dart';
import 'package:lpmi/controller/home_controller.dart';
import 'package:lpmi/model/offer.dart';
import 'package:provider/provider.dart';

class AddOfferScreen extends StatefulWidget {
  final Offer? offer;

  const AddOfferScreen({super.key, this.offer});

  @override
  State<AddOfferScreen> createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddOfferScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _timeController;
  late final TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.offer?.title ?? "");
    _descriptionController =
        TextEditingController(text: widget.offer?.description ?? "");
    _timeController =
        TextEditingController(text: widget.offer?.time.toString() ?? "");
    _locationController =
        TextEditingController(text: widget.offer?.location ?? "");
  }

  Future<void> _saveOffer() async {
    final offer = Offer(
      id: widget.offer?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      description: _descriptionController.text,
      time: int.tryParse(_timeController.text) ?? 0,
      startDate: DateTime.now(),
      location: _locationController.text,
    );

    if (widget.offer == null) {
      await Provider.of<HomeController>(context, listen: false).addOffer(offer);
      Navigator.pop(context);
    } else {
      Navigator.pop(context, offer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.offer == null ? "Ajouter une offre" : "Modifier l'offre"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "titre de l'offre",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: "description",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "durée",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: "lieu",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveOffer,
              child: const Text("Enregistrer"),
            ),
          ],
        ),
      ),
    );
  }
}
