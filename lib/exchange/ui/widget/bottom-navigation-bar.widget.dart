import 'package:finansalproje/constants.dart';
import 'package:finansalproje/exchange/ui/pages/converter.page.dart';
import 'package:finansalproje/exchange/ui/pages/graphs.page.dart';
import 'package:finansalproje/exchange/ui/pages/rates.page.dart';
import 'package:finansalproje/exchange/ui/pages/profil.page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget({Key key}) : super(key: key);

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarWidget> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String appBarTitle = "Dönüştürücü";

  var currentTab = [
    RatesPage(),
    ExchangePage(),
    GraphsPage(),
    ProfilPage()
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
          title: Text(
            appBarTitle,
          ),
          centerTitle: true,
          elevation: 0.0,
        ), 
      body: IndexedStack(
        index: provider.currentIndex,
        children: currentTab,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
          if(index == 0){
            setState(() {
              appBarTitle = "Kurlar";
            });
          } else if(index == 1){
            setState(() {
              appBarTitle = "Dönüştürücü";
            });
          } else if(index == 2){
            setState(() {
              appBarTitle = "Grafik";
            }
            );
          }
          else if(index == 3){
            setState(() {
              appBarTitle = "Profil";
            }
            );
          }
        },
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/dollar-sign.png'),
            activeIcon: Image.asset('assets/images/dollar-sign-active.png'),
            title: Text('Kurlar'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/converter.png'),
            activeIcon: Image.asset('assets/images/converter-active.png'),
            title: Text('Dönüştürücü'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/graph.png'),
            activeIcon: Image.asset('assets/images/graph-active.png'),
            title: Text('Grafik'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            activeIcon: Icon(Icons.person, color: kPrimaryColor,),
            title: Text('Profil'),
           // label: "Cüzdan"

          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 1;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}