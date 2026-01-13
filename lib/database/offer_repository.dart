import 'package:lpmi/model/offer.dart';
import 'package:lpmi/model/fake_data.dart';

class OfferRepository {
  static final List<Offer> _offers = List<Offer>.from(myOffers);

  Future<List<Offer>> getAllOffers() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return List<Offer>.from(_offers);
  }

  Future<void> insertOffer(Offer offer) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _offers.add(offer);
  }

  Future<void> deleteOffer(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _offers.removeWhere((o) => o.id == id);
  }

  Future<void> updateOffer(Offer offer) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _offers.indexWhere((o) => o.id == offer.id);
    if (index != -1) {
      _offers[index] = offer;
    }
  }

  Future<Offer?> getOfferById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      return _offers.firstWhere((o) => o.id == id);
    } catch (_) {
      return null;
    }
  }
}
