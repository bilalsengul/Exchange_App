import 'package:finansalproje/screens/components/formlar.dart';
import 'package:finansalproje/screens/components/widgets.dart';
import 'package:finansalproje/screens/giris_yap/components/body.dart';
import 'package:finansalproje/screens/kayit_ol/components/profil_bilgileri.dart';
import 'package:finansalproje/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

  TextEditingController _eMail = TextEditingController();
  TextEditingController _password = TextEditingController();

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
                      //buildEmail(context),
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
                        height: yuksekligeGoreAyarla(context, 20),
                      ),
                      //buildSifre(context,dogrulama: false),
                      SizedBox(
                        height: yuksekligeGoreAyarla(context, 20),
                      ),
                      //buildSifre(context,dogrulama: true),
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
                        height: yuksekligeGoreAyarla(context, 30),
                      ),
                    ],
                  )
              ),
              Column(children: [
                Button(
                  onPressed: () async {
                    await Firebase.initializeApp();
                    if(await register(_eMail.text, _password.text)) {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _eMail.text, password: _password.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Container(
                              child: Text("başarıyla giris yapildi"),
                            )),
                      );
                    }

                  },
                  title: "Kayıt Ol",
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

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}