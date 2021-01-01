import 'package:finansalproje/constants.dart';
import 'package:finansalproje/screens/components/widgets.dart';
import 'package:finansalproje/screens/giris_yap/giris_ekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class _ProfilPageState extends State<ProfilPage> {
  User _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(
              color: Colors.white,
              height: yuksekligeGoreAyarla(context, 12),
            ),
            Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYPRLSISP2uoEdGxNPVFrz02gI2KWiJ_VwNA&usqp=CAU"),
            Divider(
              color: Colors.white,
              height: yuksekligeGoreAyarla(context, 25),
            ),
            Text(
              _user.email,
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: yuksekligeGoreAyarla(context, 25),
                  fontFamily: "Muli",
                  fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 2),

            FlatButton(
              color: Colors.red,
              child: Text(
                "Çıkış Yap",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {

                if (await cikisYap(_firebaseAuth)) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => GirisEkrani()),
                  );
                }
              },
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}

Future<bool> cikisYap(FirebaseAuth _fire) async {
  try {
    await _fire.signOut();
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
