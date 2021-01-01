import 'package:finansalbt/screens/components/formlar.dart';
import 'package:finansalbt/screens/components/widgets.dart';
import 'package:finansalbt/screens/giris_yap/components/body.dart';
import 'package:finansalbt/screens/kayit_ol/components/profil_bilgileri.dart';
import 'package:finansalbt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Container(
          margin: EdgeInsets.only(top: genisligeGoreAyarla(context, 42)),

          child: SizedBox(
        width: double.infinity,
         child: Padding(
           padding:  EdgeInsets.symmetric(horizontal: genisligeGoreAyarla(context,24),),
          child: Column(
            children: <Widget>[
              Text(
                "Hesabınızı Oluşturun",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: yuksekligeGoreAyarla(context, 28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: yuksekligeGoreAyarla(context, 48),),
              KayitFormu(),

            ],
          ),
        ),
      ),
    ));
  }
}

class KayitFormu extends StatefulWidget {
  @override
  _KayitFormuState createState() => _KayitFormuState();
}

class _KayitFormuState extends State<KayitFormu> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: <Widget>[
             Container(
               child: Column(
                 children: [
                   buildEmail(context),
                   SizedBox(
                     height: yuksekligeGoreAyarla(context, 20),
                   ),
                   buildSifre(context,dogrulama: false),
                   SizedBox(
                     height: yuksekligeGoreAyarla(context, 20),
                   ),
                   buildSifre(context,dogrulama: true),
                   SizedBox(
                     height: yuksekligeGoreAyarla(context, 30),
                   ),
                 ],
               )
             ),
              Column(children: [
                Button(
                  onPressed: () {
                    if(_formKey.currentState.validate())
                      {
                        _formKey.currentState.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilBilgileri()

                          ),
                        );
                      }

                  },
                  title: "Devam Et",
                  buttonColor: kPrimaryColor,
                  fontColor: Colors.white,
                  fontSize: yuksekligeGoreAyarla(context, 21),
                ),

              ],)
            ],
          ),
        ),
      ),
    );
  }}

