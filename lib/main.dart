import 'package:crypto_currency_app/src/screens/currencies_screen.dart';
import 'package:crypto_currency_app/src/screens/home_screen.dart';
import 'package:crypto_currency_app/src/services/auth_service.dart';
import 'package:crypto_currency_app/src/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FirestoreDatabase()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kripton',
      home: hasCurrentUser() ? CurrenciesScreen() : HomeScreen(),
    );
  }
}
