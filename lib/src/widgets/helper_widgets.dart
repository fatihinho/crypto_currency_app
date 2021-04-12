import 'package:flutter/material.dart';

class CoinLogo extends StatelessWidget {
  final String code;
  CoinLogo(this.code);

  @override
  Widget build(BuildContext context) {
    switch (code) {
      case 'BTC':
        return Image.asset('assets/bitcoin.png');

      case 'ETH':
        return Image.asset('assets/ethereum.png');

      case 'XRP':
        return Image.asset('assets/ripple.png');

      case 'LTC':
        return Image.asset('assets/litecoin.png');

      case 'USDT':
        return Image.asset('assets/tether.png');

      case 'XLM':
        return Image.asset('assets/stellar.png');

      case 'NEO':
        return Image.asset('assets/neo.png');

      case 'EOS':
        return Image.asset('assets/eos.png');

      case 'DASH':
        return Image.asset('assets/dash.png');

      case 'LINK':
        return Image.asset('assets/chainlink.png');

      case 'ATOM':
        return Image.asset('assets/cosmos.png');

      case 'XTZ':
        return Image.asset('assets/tezos.png');

      case 'TRX':
        return Image.asset('assets/tron.png');

      case 'ADA':
        return Image.asset('assets/cardano.png');

      case 'DOT':
        return Image.asset('assets/polkadot.png');

      case 'USDC':
        return Image.asset('assets/usdcoin.png');

      case 'UNI':
        return Image.asset('assets/uniswap.png');

      case 'ANKR':
        return Image.asset('assets/ankr.png');

      case 'MKR':
        return Image.asset('assets/maker.png');
    }
    return Container();
  }
}
