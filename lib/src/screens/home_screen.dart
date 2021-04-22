import 'package:crypto_currency_app/src/screens/currencies_screen.dart';
import 'package:crypto_currency_app/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:crypto_currency_app/src/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthScreen = size.width;
    return Scaffold(
      backgroundColor: AppColors.homeScreenBGColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                      child: Text('Kripton',
                          style: TextStyle(
                              fontSize: 52.0,
                              color: AppColors.logoColor,
                              fontFamily: GoogleFonts.lobster().fontFamily))),
                  SizedBox(height: 16.0),
                  Container(
                      width: 240,
                      height: 240,
                      child: Image.asset('assets/cryptocurrency.png')),
                ],
              ),
              Column(
                children: [
                  Text("BORSADAN ANINDA HABERDAR OL",
                      style: TextStyle(
                        color: AppColors.homeTextColor1,
                        fontFamily: GoogleFonts.jura().fontFamily,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 4.0),
                  Text("KRİPTON'UN GÜCÜNÜ KEŞFETMEYE",
                      style: TextStyle(
                        color: AppColors.homeTextColor2,
                        fontFamily: GoogleFonts.jura().fontFamily,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 32.0),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: widthScreen * 0.5, height: 40.0),
                      child: ElevatedButton(
                        onPressed: () {
                          signInAnonymous().then((value) => {
                                if (value)
                                  {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CurrenciesScreen()))
                                  }
                              });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'BAŞLA',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.play_arrow),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.startButtonColor,
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
        ],
      ),
    );
  }
}
