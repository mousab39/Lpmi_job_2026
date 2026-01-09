import 'package:flutter/cupertino.dart';
import 'package:lpmi/model/fake_data.dart';
import 'package:lpmi/model/offer.dart';

class HomeController extends ChangeNotifier {
  List<Offer> offers = [];

  Future<void> loadOffers() async {
    await Future.delayed(const Duration(seconds: 1));
    offers = myOffers;
    notifyListeners();
  }

  int get offersCount => offers.length;
}
