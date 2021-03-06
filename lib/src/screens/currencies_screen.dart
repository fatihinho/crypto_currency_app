import 'dart:async';

import 'package:crypto_currency_app/src/screens/currencies_favorite_screen.dart';
import 'package:crypto_currency_app/src/services/firestore_service.dart';
import 'package:crypto_currency_app/src/utils/format_util.dart';
import 'package:crypto_currency_app/src/utils/sort_util.dart';
import 'package:crypto_currency_app/src/widgets/currency_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:crypto_currency_app/src/constants/colors.dart';
import 'package:crypto_currency_app/src/services/currency_api_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CurrenciesScreen extends StatefulWidget {
  @override
  _CurrenciesScreenState createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  var _searchTyped = false;
  var _appBarSearch = const TextField();
  var _searchIcon = const Icon(Icons.search);
  var _filterIcon = const Icon(Icons.sort);
  var _filterName = FilterNames.NAME_ASC;
  var _appBarTitle = Text('Kripton',
      style: TextStyle(
          color: Colors.yellow,
          fontSize: 36.0,
          fontFamily: GoogleFonts.lobster().fontFamily));

  final _searchController = TextEditingController();

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        _searchTyped = !_searchTyped;
        this._searchIcon = Icon(Icons.close);
        if (_searchTyped) {
          this._appBarSearch = TextField(
              autofocus: true,
              controller: _searchController,
              onChanged: (String value) {
                setState(() {});
              },
              style: TextStyle(color: Colors.white54),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffix: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white54,
                    size: 20.0,
                  ),
                  onTap: () {
                    setState(() {
                      this._searchController.clear();
                    });
                  },
                ),
                hintText: 'Ara',
                hintStyle: TextStyle(color: Colors.white54),
              ));
        }
      } else {
        _searchTyped = !_searchTyped;
        this._searchIcon = Icon(Icons.search);
        _searchController.clear();
      }
    });
  }

  Route _navigateToCurrenciesFavorite() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          CurrenciesFavoriteScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
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

  late Timer _timer;
  late Future<List> _futureCurrencies;

  @override
  void initState() {
    super.initState();
    _futureCurrencies = fetchCurrencies();
    Timer.periodic(Duration(seconds: 1), (timer) {
      _timer = timer;
      setState(() {
        _futureCurrencies = fetchCurrencies();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<FirestoreDatabase>(context).initFavoriteCurrencies();
    return Scaffold(
      backgroundColor: AppColors.currencyScreenBGColor,
      appBar: AppBar(
        centerTitle: true,
        title: _searchTyped ? _appBarSearch : _appBarTitle,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
            child: Icon(Icons.favorite_border),
            onTap: () {
              Navigator.of(context).push(_navigateToCurrenciesFavorite());
            }),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (this._filterName == FilterNames.NAME_ASC) {
                      this._filterName = FilterNames.NAME_DESC;
                    } else if (this._filterName == FilterNames.NAME_DESC) {
                      this._filterName = FilterNames.PRICE_ASC;
                    } else if (this._filterName == FilterNames.PRICE_ASC) {
                      this._filterName = FilterNames.PRICE_DESC;
                    } else if (this._filterName == FilterNames.PRICE_DESC) {
                      this._filterName = FilterNames.PERCENT_ASC;
                    } else if (this._filterName == FilterNames.PERCENT_ASC) {
                      this._filterName = FilterNames.PERCENT_DESC;
                    } else if (this._filterName == FilterNames.PERCENT_DESC) {
                      this._filterName = FilterNames.NAME_ASC;
                    }
                  });
                },
                child: this._filterIcon,
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  _searchPressed();
                },
                child: _searchIcon,
              ))
        ],
      ),
      body: FutureBuilder(
          future: _futureCurrencies,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (this._filterName == FilterNames.NAME_ASC) {
              SortUtils.orderByNameAsc(snapshot);
            } else if (this._filterName == FilterNames.NAME_DESC) {
              SortUtils.orderByNameDesc(snapshot);
            } else if (this._filterName == FilterNames.PRICE_ASC) {
              SortUtils.orderByPriceAsc(snapshot);
            } else if (this._filterName == FilterNames.PRICE_DESC) {
              SortUtils.orderByPriceDesc(snapshot);
            } else if (this._filterName == FilterNames.PERCENT_ASC) {
              SortUtils.orderByPercentAsc(snapshot);
            } else if (this._filterName == FilterNames.PERCENT_DESC) {
              SortUtils.orderByPercentDesc(snapshot);
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Icon(Icons.error_outline));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  if (_searchController.text.isEmpty &&
                      FormatUtils.cryptoCodeToName(
                              snapshot.data[index]['numeratorSymbol'])
                          .isNotEmpty) {
                    return CurrencyList(index, snapshot.data);
                  } else if (FormatUtils.cryptoCodeToName(
                              snapshot.data[index]['numeratorSymbol'])
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase()) &&
                      FormatUtils.cryptoCodeToName(
                              snapshot.data[index]['numeratorSymbol'])
                          .isNotEmpty) {
                    return CurrencyList(index, snapshot.data);
                  } else {
                    return Container();
                  }
                },
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
              );
            }
          }),
    );
  }
}
