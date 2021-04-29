import 'package:flutter/material.dart';

class CoinLogo extends StatelessWidget {
  final String code;
  CoinLogo(this.code);

  final logoUrl = 'https://s2.coinmarketcap.com/static/img/coins/64x64/';

  @override
  Widget build(BuildContext context) {
    switch (code) {
      case 'BTC':
        return Image.network(logoUrl + '1.png');

      case 'ETH':
        return Image.network(logoUrl + '1027.png');

      case 'XRP':
        return Image.network(logoUrl + '52.png');

      case 'LTC':
        return Image.network(logoUrl + '2.png');

      case 'USDT':
        return Image.network(logoUrl + '825.png');

      case 'XLM':
        return Image.network(logoUrl + '512.png');

      case 'NEO':
        return Image.network(logoUrl + '1376.png');

      case 'EOS':
        return Image.network(logoUrl + '1765.png');

      case 'DASH':
        return Image.network(logoUrl + '131.png');

      case 'LINK':
        return Image.network(logoUrl + '1975.png');

      case 'ATOM':
        return Image.network(logoUrl + '3794.png');

      case 'XTZ':
        return Image.network(logoUrl + '2011.png');

      case 'TRX':
        return Image.network(logoUrl + '1958.png');

      case 'ADA':
        return Image.network(logoUrl + '2010.png');

      case 'DOT':
        return Image.network(logoUrl + '6636.png');

      case 'USDC':
        return Image.network(logoUrl + '3408.png');

      case 'UNI':
        return Image.network(logoUrl + '7083.png');

      case 'ANKR':
        return Image.network(logoUrl + '3783.png');

      case 'MKR':
        return Image.network(logoUrl + '1518.png');

      case 'ENJ':
        return Image.network(logoUrl + '2130.png');

      case 'OMG':
        return Image.network(logoUrl + '1808.png');

      case 'COMP':
        return Image.network(logoUrl + '5692.png');

      case 'GRT':
        return Image.network(logoUrl + '6719.png');

      case 'MANA':
        return Image.network(logoUrl + '1966.png');

      case 'MATIC':
        return Image.network(logoUrl + '3890.png');

      case 'SNX':
        return Image.network(logoUrl + '2586.png');

      case 'BAT':
        return Image.network(logoUrl + '1697.png');
    }
    return Container();
  }
}
