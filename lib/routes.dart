import 'package:finansalbt/screens/giris_yap/giris_ekrani.dart';
import 'package:finansalbt/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String,WidgetBuilder> routes= {

  SplashScreen.routeName: (context)=> SplashScreen(),
  GirisEkrani.routeName: (context)=> GirisEkrani(),
};