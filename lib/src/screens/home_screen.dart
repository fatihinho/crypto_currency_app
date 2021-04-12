import 'package:crypto_currency_app/src/screens/currencies_screen.dart';
import 'package:flutter/material.dart';
import 'package:crypto_currency_app/src/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightScreen = size.height;
    return Scaffold(
      backgroundColor: AppColors.homeScreenBGColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                  width: 240,
                  height: 240,
                  margin: EdgeInsets.only(top: heightScreen * 0.15),
                  child: Image.asset('assets/cryptocurrency.png')),
              SizedBox(height: 92.0),
              Text(
                'Ücretsiz hesap oluştur',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 180.0, height: 40.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Hesap Oluştur',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.registerButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 180.0, height: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CurrenciesScreen()));
                    },
                    child: Text(
                      'Giriş Yap',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.loginButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
