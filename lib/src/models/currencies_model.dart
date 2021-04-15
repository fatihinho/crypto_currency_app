class Currencies {
  String? pair;
  String? pairNormalized;
  int? timestamp;
  int? last;
  int? high;
  int? low;
  int? bid;
  int? ask;
  int? open;
  double? volume;
  double? average;
  int? daily;
  double? dailyPercent;
  String? denominatorSymbol;
  String? numeratorSymbol;
  int? order;

  Currencies(
      {this.pair,
      this.pairNormalized,
      this.timestamp,
      this.last,
      this.high,
      this.low,
      this.bid,
      this.ask,
      this.open,
      this.volume,
      this.average,
      this.daily,
      this.dailyPercent,
      this.denominatorSymbol,
      this.numeratorSymbol,
      this.order});

  Currencies.fromJson(Map<String, dynamic> json) {
    pair = json['pair'];
    pairNormalized = json['pairNormalized'];
    timestamp = json['timestamp'];
    last = json['last'];
    high = json['high'];
    low = json['low'];
    bid = json['bid'];
    ask = json['ask'];
    open = json['open'];
    volume = json['volume'];
    average = json['average'];
    daily = json['daily'];
    dailyPercent = json['dailyPercent'];
    denominatorSymbol = json['denominatorSymbol'];
    numeratorSymbol = json['numeratorSymbol'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pair'] = this.pair;
    data['pairNormalized'] = this.pairNormalized;
    data['timestamp'] = this.timestamp;
    data['last'] = this.last;
    data['high'] = this.high;
    data['low'] = this.low;
    data['bid'] = this.bid;
    data['ask'] = this.ask;
    data['open'] = this.open;
    data['volume'] = this.volume;
    data['average'] = this.average;
    data['daily'] = this.daily;
    data['dailyPercent'] = this.dailyPercent;
    data['denominatorSymbol'] = this.denominatorSymbol;
    data['numeratorSymbol'] = this.numeratorSymbol;
    data['order'] = this.order;
    return data;
  }
}
