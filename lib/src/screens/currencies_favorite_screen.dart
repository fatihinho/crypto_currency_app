import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_currency_app/src/constants/colors.dart';
import 'package:crypto_currency_app/src/services/auth_service.dart';
import 'package:crypto_currency_app/src/services/currency_api_service.dart';
import 'package:crypto_currency_app/src/widgets/currency_favorite_widget.dart';
import 'package:flutter/material.dart';

class CurrenciesFavoriteScreen extends StatefulWidget {
  @override
  _CurrenciesFavoriteScreenState createState() =>
      _CurrenciesFavoriteScreenState();
}

class _CurrenciesFavoriteScreenState extends State<CurrenciesFavoriteScreen> {
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 500))
        .then((value) => {super.setState(() {})});
  }

  final _firestore = FirebaseFirestore.instance
      .collection('userData')
      .doc(getUID())
      .collection('favorites');

  List<QueryDocumentSnapshot> _favorites = [];

  void _initFavoriteCurrencies() async {
    _favorites = await _firestore.get().then((value) => value.docs);
  }

  @override
  void initState() {
    super.initState();
    _initFavoriteCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.currencyDetailScreenBGColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            children: [
              Text('Favoriler'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.favorite, color: Colors.red),
              ),
            ],
          )),
      body: FutureBuilder(
          future: getCurrenciesData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Icon(Icons.error_outline));
            } else {
              if (_favorites.length > 0) {
                return RefreshIndicator(
                  onRefresh: () => _onRefresh(),
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (_favorites.isNotEmpty) {
                        if (_favorites.any((element) =>
                            element['numeratorSymbol'] ==
                            snapshot.data[index]['numeratorSymbol'])) {
                          return CurrencyFavoriteList(index, snapshot.data);
                        }
                      }
                      return Container();
                    },
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                  ),
                );
              } else {
                return Center(
                    child: Icon(
                  Icons.favorite_border,
                  color: Colors.white10,
                  size: 128.0,
                ));
              }
            }
          }),
    );
  }
}
