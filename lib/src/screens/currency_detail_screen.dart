import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_currency_app/src/constants/colors.dart';
import 'package:crypto_currency_app/src/services/auth_service.dart';
import 'package:crypto_currency_app/src/services/firestore_service.dart';
import 'package:crypto_currency_app/src/utils/format_util.dart';
import 'package:crypto_currency_app/src/widgets/admob_banner_widget.dart';
import 'package:crypto_currency_app/src/widgets/currency_detail_widget.dart';
import 'package:crypto_currency_app/src/widgets/helper_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CurrencyDetailScreen extends StatefulWidget {
  final int index;
  final List data;
  CurrencyDetailScreen(this.index, this.data);

  @override
  _CurrencyDetailScreenState createState() => _CurrencyDetailScreenState();
}

class _CurrencyDetailScreenState extends State<CurrencyDetailScreen> {
  final _firestore = FirebaseFirestore.instance
      .collection('userData')
      .doc(getUID())
      .collection('favorites');

  var _isFavorited = false;

  void initFavorited() async {
    var fav = await _firestore.get().then((value) => value.docs).then((value) =>
        value.any((element) =>
            widget.data[widget.index]['numeratorSymbol'] ==
            element['numeratorSymbol']));
    if (fav) {
      setState(() {
        _isFavorited = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initFavorited();
  }

  @override
  Widget build(BuildContext context) {
    var firestore = Provider.of<FirestoreDatabase>(context);
    var code = widget.data[widget.index]['numeratorSymbol'];

    return Scaffold(
      backgroundColor: AppColors.currencyDetailScreenBGColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: CoinLogo(widget.data[widget.index]['numeratorSymbol']),
              height: 36.0,
              width: 36.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '${FormatUtils.cryptoCodeToName(widget.data[widget.index]['numeratorSymbol'])}'),
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                child: Icon(
                    _isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorited ? Colors.red : Colors.white),
                onTap: () async {
                  if (!this._isFavorited) {
                    await firestore.addFavoriteCurrency(code);
                    this._isFavorited = !this._isFavorited;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: const Text('Favorilere eklendi'),
                      ),
                    );
                  } else {
                    await firestore.removeFavoriteCurrency(code);
                    this._isFavorited = !this._isFavorited;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: const Text('Favorilerden kaldırıldı'),
                      ),
                    );
                  }
                }),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AdMobBanner(),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CryptoDetails(this.widget.index, this.widget.data)),
          ),
          AdMobBanner(),
        ],
      ),
    );
  }
}
