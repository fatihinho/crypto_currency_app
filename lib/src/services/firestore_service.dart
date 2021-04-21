import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_currency_app/src/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class FirestoreDatabase extends ChangeNotifier {
  List<QueryDocumentSnapshot> _favorites = [];

  List<QueryDocumentSnapshot> get favorites => _favorites;

  CollectionReference _firestore = FirebaseFirestore.instance
      .collection('userData')
      .doc(getUID())
      .collection('favorites');

  Future<void> initFavoriteCurrencies() async {
    await _firestore.get().then((value) => _favorites = value.docs);
    notifyListeners();
  }

  Future<void> addFavoriteCurrency(String code) async {
    _firestore
        .add({'numeratorSymbol': code}).catchError((e) => throw e.toString());
    notifyListeners();
  }

  Future<void> removeFavoriteCurrency(String code) async {
    var numeratorSymbol = await _firestore.get().then((value) =>
        value.docs.firstWhere((element) => element['numeratorSymbol'] == code));
    _firestore
        .doc(numeratorSymbol.id)
        .delete()
        .catchError((e) => throw e.toString());
    notifyListeners();
  }
}
