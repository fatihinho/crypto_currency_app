import 'package:flutter/material.dart';

import 'format_util.dart';

enum FilterNames {
  NAME_ASC,
  NAME_DESC,
  PRICE_ASC,
  PRICE_DESC,
  PERCENT_ASC,
  PERCENT_DESC
}

class SortUtils {
  static void orderByNameAsc(AsyncSnapshot snapshot) {
    snapshot.data?.sort((a, b) =>
        FormatUtils.cryptoCodeToName(a['numeratorSymbol']).toString().compareTo(
            FormatUtils.cryptoCodeToName(b['numeratorSymbol'].toString())));
  }

  static void orderByNameDesc(AsyncSnapshot snapshot) {
    snapshot.data?.sort((a, b) =>
        FormatUtils.cryptoCodeToName(b['numeratorSymbol']).toString().compareTo(
            FormatUtils.cryptoCodeToName(a['numeratorSymbol'].toString())));
  }

  static void orderByPriceAsc(AsyncSnapshot snapshot) {
    snapshot.data
        ?.sort((a, b) => (a['last'] as double).compareTo(b['last'] as double));
  }

  static void orderByPriceDesc(AsyncSnapshot snapshot) {
    snapshot.data
        ?.sort((a, b) => (b['last'] as double).compareTo(a['last'] as double));
  }

  static void orderByPercentAsc(AsyncSnapshot snapshot) {
    snapshot.data?.sort((a, b) =>
        (a['dailyPercent'] as double).compareTo(b['dailyPercent'] as double));
  }

  static void orderByPercentDesc(AsyncSnapshot snapshot) {
    snapshot.data?.sort((a, b) =>
        (b['dailyPercent'] as double).compareTo((a['dailyPercent'] as double)));
  }
}
