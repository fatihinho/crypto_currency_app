import 'package:crypto_currency_app/src/constants/colors.dart';
import 'package:crypto_currency_app/src/services/currencies_data_service.dart';
import 'package:crypto_currency_app/src/widgets/currency_list_widget.dart';
import 'package:flutter/material.dart';

class CurrenciesFavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.currencyDetailScreenBGColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            children: [
              Text('Favoriler'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.favorite, color: Colors.red),
              ),
            ],
          )),
      body: FutureBuilder(
          future: getCurrenciesData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Icon(Icons.error_outline));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CurrencyList(index, snapshot.data);
                  });
            }
          }),
    );
  }
}
