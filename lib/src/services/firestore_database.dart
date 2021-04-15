import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreDatabase extends ChangeNotifier {
  CollectionReference favorites =
      FirebaseFirestore.instance.collection('favorites');

  Future<void> addFavoriteCurrency(String code) async {
    favorites.add({'numeratorSymbol': code}).catchError((e) {
      throw e.toString();
    });
    notifyListeners();
  }

  Future<void> removeFavoriteCurrency(String code) async {
    var numeratorSymbol = await favorites.get().then((value) =>
        value.docs.firstWhere((element) => element['numeratorSymbol'] == code));
    favorites.doc(numeratorSymbol.id).delete();
    notifyListeners();
  }
}
