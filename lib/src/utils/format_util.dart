class FormatUtils {
  static String cryptoCodeToName(String code) {
    switch (code) {
      case 'BTC':
        return 'Bitcoin ($code)';
      case 'ETH':
        return 'Ethereum ($code)';
      case 'XRP':
        return 'Ripple ($code)';
      case 'LTC':
        return 'Litecoin ($code)';
      case 'USDT':
        return 'Tether ($code)';
      case 'XLM':
        return 'Stellar ($code)';
      case 'NEO':
        return 'Neo ($code)';
      case 'EOS':
        return 'EOS ($code)';
      case 'DASH':
        return 'Dash ($code)';
      case 'LINK':
        return 'Chainlink ($code)';
      case 'ATOM':
        return 'Cosmos ($code)';
      case 'XTZ':
        return 'Tezos ($code)';
      case 'TRX':
        return 'TRON ($code)';
      case 'ADA':
        return 'Cardano ($code)';
      case 'DOT':
        return 'Polkadot ($code)';
      case 'USDC':
        return 'USD Coin ($code)';
      case 'UNI':
        return 'Uniswap ($code)';
      case 'ANKR':
        return 'Ankr ($code)';
      case 'MKR':
        return 'Maker ($code)';
      case 'OMG':
        return 'OMG Network ($code)';
      case 'ENJ':
        return 'Enjin Coin ($code)';
      case 'COMP':
        return 'Compound ($code)';
      case 'GRT':
        return 'The Graph ($code)';
      case 'MANA':
        return 'Decentraland ($code)';
      case 'MATIC':
        return 'Polygon ($code)';
      case 'SNX':
        return 'Synthetix ($code)';
      case 'BAT':
        return 'Basic Attention Token ($code)';
    }
    return '';
  }
}
