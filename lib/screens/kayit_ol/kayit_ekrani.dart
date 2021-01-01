import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/body.dart';

class KayitEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,

      appBar: _appBar(context),
      body: Body(),
    );
  }
}

AppBar _appBar(BuildContext context){


  return AppBar(
    centerTitle: true,
    title: Text("Kayıt Ol", style: TextStyle(
        color: kPrimaryColor,
        fontSize: yuksekligeGoreAyarla(context,27)),),

    leading:  IconButton(
      icon:  Icon(Icons.arrow_back_ios),
      onPressed: () => {
        Navigator.pop(context)

      },
    ),
  );
}