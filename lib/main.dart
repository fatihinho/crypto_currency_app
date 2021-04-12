import 'package:crypto_currency_app/src/screens/currencies_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Crypto Currency',
      theme: ThemeData(fontFamily: GoogleFonts.roboto().fontFamily),
      home: CurrenciesScreen(),
    );
  }
}
