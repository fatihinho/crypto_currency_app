import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchCurrencies() async {
  final apiUrl =
      Uri.parse('https://api.btcturk.com/api/v2/ticker/currency?symbol=TRY');

  final response = await http.get(apiUrl);
  final currencies = json.decode(response.body);

  if (response.statusCode == 200) {
    return currencies['data'];
  } else {
    throw Exception('Hata Kodu: ${response.statusCode}');
  }
}
