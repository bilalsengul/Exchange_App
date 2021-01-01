
import 'package:finansalbt/routes.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

import 'constants.dart';
import 'screens/splash/splash_screen.dart';
import 'size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FİNANSAL BT',

      theme:tema(context),
      home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
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