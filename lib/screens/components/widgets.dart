import 'package:finansalproje/constants.dart';
import 'package:finansalproje/screens/kayit_ol/kayit_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:finansalproje/screens/giris_yap/components/body.dart';
import '../../size_config.dart';

class SosyalMedyaGiris extends StatelessWidget {
  final Function func;

  const SosyalMedyaGiris({
    Key key,
    this.func
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SignInButton(

          Buttons.GoogleDark,
          elevation: 8,
          //     padding: EdgeInsets.all(8),
          text: "Google ile Giriş Yap",
          onPressed:(){}
        ),

      ],
    );
  }
}
class Button extends StatelessWidget {
  final Function onPressed;
  final Color buttonColor;
  final Color fontColor;
  final double fontSize;
  final String title;

  const Button(
      {Key key,
        @required this.onPressed,
        this.buttonColor,
        this.fontColor,
        this.title,
        this.fontSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(

      padding: EdgeInsets.symmetric(vertical: 12.0),
      onPressed: onPressed,
      color: buttonColor ?? Colors.lightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          SizedBox(
            width: 4.0,
          ),
          Text(
            title ,
            style: TextStyle(
                color: fontColor ?? Colors.white,
                fontSize: fontSize
            ),
          ),
        ],
      ),
    );
  }
}
class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(top: genisligeGoreAyarla(context, 2)),
          child: Text(
            "Bir Hesabınız Yok Mu? ",
            style: TextStyle(fontSize: genisligeGoreAyarla(context,14)),
            textAlign: TextAlign.justify,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  KayitEkrani(),
              )),

          child: Text(
            "Kayıt Olun",
            style: TextStyle(
                fontSize: genisligeGoreAyarla(context,16),
                color: kTextColor),
          ),
        ),
      ],
    );
  }
}
