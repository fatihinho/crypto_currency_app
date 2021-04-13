import 'package:crypto_currency_app/src/constants/colors.dart';
import 'package:crypto_currency_app/src/screens/currency_detail_screen.dart';
import 'package:crypto_currency_app/src/utils/format_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'helper_widgets.dart';

class CurrencyList extends StatelessWidget {
  final int index;
  final List data;
  CurrencyList(this.index, this.data);

  final formatter = NumberFormat('#,##0.00', 'tr_TR');

  Route _navigateToCurrencyDetail() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          CurrencyDetailScreen(this.index, this.data),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
          onTap: () {
            Navigator.of(context).push(_navigateToCurrencyDetail());
          },
          minVerticalPadding: 16.0,
          leading: CircleAvatar(
              radius: 36.0, child: CoinLogo(data[index]['numeratorSymbol'])),
          title: Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '${FormatUtils.cryptoCodeToName(data[index]['numeratorSymbol'])}',
              style:
                  TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                '${formatter.format(data[index]['last'])} ₺',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(left: 16.0),
                decoration: BoxDecoration(
                    color: data[index]['dailyPercent'] >= 0
                        ? AppColors.dailyPercentPositive
                        : AppColors.dailyPercentNegative,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(8.0),
                        right: Radius.circular(8.0))),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    '${data[index]['dailyPercent']}%',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
