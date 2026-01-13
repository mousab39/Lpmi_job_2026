import 'package:flutter/cupertino.dart';
import 'package:lpmi/database/offer_repository.dart';
import 'package:lpmi/model/offer.dart';

class HomeController extends ChangeNotifier {
  final OfferRepository _repository = OfferRepository();

  List<Offer> offers = [];

  Future<void> loadOffers() async {
    offers = await _repository.getAllOffers();
    notifyListeners();
  }

  Future<void> addOffer(Offer offer) async {
    await _repository.insertOffer(offer);
    await loadOffers();
  }

  Future<void> deleteOffer(String id) async {
    await _repository.deleteOffer(id);
    await loadOffers();
  }

  Future<void> updateOffer(Offer offer) async {
    await _repository.updateOffer(offer);
    await loadOffers();
  }
}
