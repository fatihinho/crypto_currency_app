import 'package:crypto_currency_app/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CryptoDetails extends StatefulWidget {
  final int index;
  final List data;
  CryptoDetails(this.index, this.data);

  @override
  _CryptoDetailsState createState() => _CryptoDetailsState();
}

class _CryptoDetailsState extends State<CryptoDetails> {
  final formatter = NumberFormat('#,##0.00', 'tr_TR');

  final divider = const Divider(
    thickness: 1,
    color: Colors.white70,
    indent: 8.0,
    endIndent: 8.0,
  );

  bool _isIncrease = true;

  @override
  void initState() {
    if (widget.data[widget.index]['daily'] < 0) {
      _isIncrease = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Son Fiyat: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.white54)),
                Text('${formatter.format(widget.data[widget.index]['last'])} ₺',
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
                _isIncrease
                    ? Icon(
                        Icons.arrow_drop_up,
                        color: AppColors.dailyPositiveColor,
                      )
                    : Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.dailyNegativeColor,
                      )
              ],
            ),
          ),
          divider,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('En İyi Alış: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.white54)),
                Text('${formatter.format(widget.data[widget.index]['bid'])} ₺',
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
              ],
            ),
          ),
          divider,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('En İyi Satış: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.white54)),
                Text('${formatter.format(widget.data[widget.index]['ask'])} ₺',
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
              ],
            ),
          ),
          divider,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('24s Değişim: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.white54)),
                Text(
                    '${!_isIncrease ? formatter.format(widget.data[widget.index]['daily'] * -1) : formatter.format(widget.data[widget.index]['daily'])} ₺ (${!_isIncrease ? widget.data[widget.index]['dailyPercent'] * -1 : widget.data[widget.index]['dailyPercent']}%)',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: _isIncrease
                            ? AppColors.dailyPositiveColor
                            : AppColors.dailyNegativeColor)),
              ],
            ),
          ),
          divider,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('24s En Yüksek: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.white54)),
                Text('${formatter.format(widget.data[widget.index]['high'])} ₺',
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
              ],
            ),
          ),
          divider,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('24s En Düşük: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.white54)),
                Text('${formatter.format(widget.data[widget.index]['low'])} ₺',
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
              ],
            ),
          ),
          divider,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('24s Ortalama: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.white54)),
                Text(
                    '${formatter.format(widget.data[widget.index]['average'])} ₺',
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
              ],
            ),
          ),
          divider,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('24s Hacim: ',
                    style: TextStyle(fontSize: 18.0, color: Colors.white54)),
                Text('${formatter.format(widget.data[widget.index]['volume'])}',
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
