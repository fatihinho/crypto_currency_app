import 'package:crypto_currency_app/src/constants/colors.dart';
import 'package:crypto_currency_app/src/utils/format_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyDetailScreen extends StatelessWidget {
  final int index;
  final List data;
  CurrencyDetailScreen(this.index, this.data);

  final formatter = NumberFormat('#,##0.00', 'tr_TR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.currencyScreenBGColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
              '${FormatUtils.cryptoCodeToName(data[index]['numeratorSymbol'])}'),
        ),
        body: Center(
            child: Text('${formatter.format(data[index]['last'])} ₺',
                style: TextStyle(fontSize: 36.0, color: Colors.white))));
  }
}
