import 'package:crypto_currency_app/src/constants/colors.dart';
import 'package:crypto_currency_app/src/utils/format_utils.dart';
import 'package:crypto_currency_app/src/widgets/currency_detail.widget.dart';
import 'package:crypto_currency_app/src/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';

class CurrencyDetailScreen extends StatelessWidget {
  final int index;
  final List data;
  CurrencyDetailScreen(this.index, this.data);

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
                child: CoinLogo(data[index]['numeratorSymbol']),
                height: 36.0,
                width: 36.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '${FormatUtils.cryptoCodeToName(data[index]['numeratorSymbol'])}'),
              ),
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CryptoDetails(this.index, this.data)));
  }
}
