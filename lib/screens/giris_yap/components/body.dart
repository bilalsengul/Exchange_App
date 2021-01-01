import 'dart:ui';

import 'package:finansalbt/screens/components/formlar.dart';
import 'package:finansalbt/screens/components/widgets.dart';
import 'package:finansalbt/screens/kayit_ol/kayit_ekrani.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(top: genisligeGoreAyarla(context, 42)),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: genisligeGoreAyarla(context, 24),
          ),
          child: Column(
            children: <Widget>[

              Text(
                "Hoş geldiniz :)",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: yuksekligeGoreAyarla(context, 30)),
              ),
              SizedBox(height: yuksekligeGoreAyarla(context, 8),),

              Text(
                "Kayıtlı e-mail adresiniz ve şifrenizle veya\n sosyal medya hesaplarınızla giriş yapabilirsiniz.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: yuksekligeGoreAyarla(context, 16)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: yuksekligeGoreAyarla(context, 36),),

              GirisFormu(),
            ],
          ),
        ),
      ),
    ));
  }
}

class GirisFormu extends StatefulWidget {
  @override
  _GirisFormuState createState() => _GirisFormuState();
}

class _GirisFormuState extends State<GirisFormu> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool remember = false;

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Expanded(
        child: Column(
          children: <Widget>[
            Container(
              // height: yuksekligeGoreAyarla(context, 200),
              child: Column(
                children: <Widget>[
                  buildEmail(context),
                  SizedBox(
                    height: yuksekligeGoreAyarla(context, 15),
                  ),
                  buildSifre(context, dogrulama: false),
                  SizedBox(
                    height: yuksekligeGoreAyarla(context, 2),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: [
                    // Checkbox(),
                    Checkbox(
                      value: remember,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          remember = value;
                        });
                      },
                    ),
                    Text("Beni Hatırla"),
                    Spacer(flex: 10),
                    Text(
                      "Şifremi Unuttum.",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                SizedBox(
                  height: yuksekligeGoreAyarla(context, 15),
                ),

                Button(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                    }
                  },
                  title: "Giriş Yap",
                  buttonColor: kPrimaryColor,
                  fontColor: Colors.white,
                  fontSize: yuksekligeGoreAyarla(context, 21),
                ),

                //Sosyal medya butonları buraya gelebilir
                NoAccountText(),
              ],
            ),
            SizedBox(
              height: yuksekligeGoreAyarla(context, 48),
            ),
            SosyalMedyaGiris(),
          ],
        ),
      ),
    );
  }
}
