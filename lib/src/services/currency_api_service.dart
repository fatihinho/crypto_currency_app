import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> getCurrencies() async {
  Uri apiUrl =
      Uri.parse('https://api.btcturk.com/api/v2/ticker/currency?symbol=TRY');
  try {
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  } catch (e) {
    throw e.toString();
  }
}

Future<List> getCurrenciesData() async {
  Map currencies = await getCurrencies();
  List currenciesData = currencies['data'];
  return currenciesData;
}
