import 'package:crypto_currency_app/src/constants/colors.dart';
import 'package:crypto_currency_app/src/utils/format_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'helper_widgets.dart';

class CurrencyList extends StatelessWidget {
  final int index;
  final AsyncSnapshot snapshot;
  CurrencyList(this.snapshot, this.index);

  final formatter = NumberFormat('#,##0.00', 'tr_TR');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
          minVerticalPadding: 16.0,
          leading: CircleAvatar(
              radius: 36.0,
              child: CoinLogo(snapshot.data[index]['numeratorSymbol'])),
          title: Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '${FormatUtils.cryptoCodeToName(snapshot.data[index]['numeratorSymbol'])}',
              style:
                  TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                '${formatter.format(snapshot.data[index]['last'])} ₺',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(left: 16.0),
                decoration: BoxDecoration(
                    color: snapshot.data[index]['dailyPercent'] >= 0
                        ? AppColors.dailyPercentPositive
                        : AppColors.dailyPercentNegative,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(8.0),
                        right: Radius.circular(8.0))),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    '${snapshot.data[index]['dailyPercent']}%',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
