import 'package:finansalproje/exchange/main2.dart';
import 'package:finansalproje/screens/giris_yap/components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

import 'constants.dart';
import 'package:finansalproje/screens/giris_yap/giris_ekrani.dart';

import 'size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(localStorage == null ? MyApp() : EasyExchange());
}


class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FİNANSAL BT',

      theme:tema(context),
      home: GirisEkrani(),
     // initialRoute: SplashScreen.routeName,
    );
  }
}

ThemeData tema(BuildContext context){
  return ThemeData(
    //errorColor: Colors.white,
    inputDecorationTheme: _inputDecerationTheme() ,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: "Muli",
    textTheme: TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor),
    ),
    appBarTheme: AppBarTheme(
      color:Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: kPrimaryColor),
      // textTheme: TextTheme(headline6: TextStyle(color: kPrimaryColor, fontSize: yuksekligeGoreAyarla(context,48)))
    ),
    //inputDecorationTheme: _inputDecoration(context)
  );

}

InputDecorationTheme _inputDecerationTheme() {
  return InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: kTextColor),

    ),
    focusedBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: kTextColor),

    ),
  );
}

/*
InputDecorationTheme _inputDecoration(BuildContext context){
 return InputDecorationTheme(

      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(context,40),vertical: getProportionateScreenWidth(context,14)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),

      ),
      focusedBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),

      ),
  );
}
*/



