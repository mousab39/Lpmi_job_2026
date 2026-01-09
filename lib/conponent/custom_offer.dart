import 'package:flutter/material.dart';
import 'package:lpmi/model/offer.dart';

class CustomOffer extends StatelessWidget {
  final Offer offer;

  const CustomOffer({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ID: ${offer.id}"),
                Text(offer.title),
              ],
            ),
            const SizedBox(height: 10),
            Text(offer.description),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${offer.time} h"),
                Text(
                  "${offer.startDate.day}/${offer.startDate.month}/${offer.startDate.year}",
                ),
                Text(offer.location),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
