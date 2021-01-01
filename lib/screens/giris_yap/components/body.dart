import 'dart:ui';

import 'package:finansalproje/exchange/main2.dart';
import 'package:finansalproje/screens/components/formlar.dart';
import 'package:finansalproje/screens/components/widgets.dart';
import 'package:finansalproje/screens/kayit_ol/kayit_ekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController _eMail  = TextEditingController();
  TextEditingController _password = TextEditingController();
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
              //    buildEmail(context, _eMail),
                  TextFormField(
                      controller: _eMail,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction ,

                      // onSaved: (newValue) => email = newValue,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                        } else if (emailValidatorRegExp.hasMatch(value)) {
                        }
                        return null;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return kEmailNullError;
                        } else if (!emailValidatorRegExp.hasMatch(value)) {
                          return kInvalidEmailError;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "E-Mail",
                        hintText: "E-mail adresiniz...",


                        suffixIcon: Icon(Icons.mail_outline, color: kTextColor),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: EdgeInsets.symmetric(horizontal: yuksekligeGoreAyarla(context,40),vertical: genisligeGoreAyarla(context,14)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: kTextColor),

                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: kTextColor),

                        ),
                      )
                  ),
                  SizedBox(
                    height: yuksekligeGoreAyarla(context, 15),
                  ),
                 // buildSifre(context,_password, dogrulama: false), ,
                  TextFormField(

                      controller: _password,
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction ,

                      onChanged: (value) {
                        if (value.isNotEmpty) {
                        } else if (value.length >= 8) {
                        }
                        return "";
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return kPassNullError;
                        } else if (value.length < 7) {
                          return kShortPassError;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Şifre",
                        hintText:  "Şifrenizi giriniz...",

                        suffixIcon: Icon(Icons.lock_outline, color: kTextColor),

                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: EdgeInsets.symmetric(horizontal: yuksekligeGoreAyarla(context,40),vertical: genisligeGoreAyarla(context,14)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: kTextColor),

                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: kTextColor),

                        ),
                      )

                  ),
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
              //  GirisYapButon(_formKey),
                Button(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      if(await signIn(_eMail.text, _password.text)) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EasyExchange(),
                        )
                        );
                      }
                      else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Container(
                                child: Text("giris yapilamadi!!"),
                              )),
                        );
                      }
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
Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    return false;
  }
}
