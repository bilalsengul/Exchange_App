import 'package:finansalbt/screens/components/formlar.dart';
import 'package:finansalbt/screens/components/widgets.dart';
import 'package:finansalbt/screens/giris_yap/giris_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../size_config.dart';
import '../../../constants.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [

    {
      "text": "Finansal BT Proje Ödevi",
      "image": "assets/images/dikeylogo.png"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                flex:3,
                child: SplashContent()),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: genisligeGoreAyarla(context,20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Spacer(),
                    Button(onPressed: () {
                      Navigator.push(
                        context,
                         MaterialPageRoute(
                          builder: (context) =>  GirisEkrani(),
                        ),
                      );
                    },
                      title: "Devam Et",buttonColor: kPrimaryColor,fontColor: Colors.white,)

                    ,Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Finansal BT Proje Ödevi",
          style: TextStyle(
            fontSize: genisligeGoreAyarla(context,28),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        Spacer(flex: 2),
        Image.asset(
          "assets/images/dikeylogo.png",
          height: yuksekligeGoreAyarla(context,265),
          width: genisligeGoreAyarla(context,235),
        ),
      ],
    );
  }
}

