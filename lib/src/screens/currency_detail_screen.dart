import 'package:crypto_currency_app/src/constants/colors.dart';
import 'package:crypto_currency_app/src/utils/format_utils.dart';
import 'package:crypto_currency_app/src/widgets/currency_detail.widget.dart';
import 'package:crypto_currency_app/src/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';

class CurrencyDetailScreen extends StatefulWidget {
  final int index;
  final List data;
  CurrencyDetailScreen(this.index, this.data);

  @override
  _CurrencyDetailScreenState createState() => _CurrencyDetailScreenState();
}

class _CurrencyDetailScreenState extends State<CurrencyDetailScreen> {
  var _isFavorited = false;

  @override
  void initState() {
    if (_isFavorited) {}
    super.initState();
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
              SizedBox(
                child: CoinLogo(widget.data[widget.index]['numeratorSymbol']),
                height: 36.0,
                width: 36.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '${FormatUtils.cryptoCodeToName(widget.data[widget.index]['numeratorSymbol'])}'),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  child: Icon(
                      _isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorited ? Colors.red : Colors.white),
                  onTap: () {
                    setState(() {
                      this._isFavorited = !this._isFavorited;
                    });
                  }),
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CryptoDetails(this.widget.index, this.widget.data)));
  }
}
