import 'package:flutter/material.dart';
import 'package:flutter_app_reclame_ja/constants.dart';
import 'package:flutter_app_reclame_ja/models/reclamacoes.dart';
import 'package:flutter_app_reclame_ja/screens/add_solicitacoes.dart';
import 'package:flutter_app_reclame_ja/screens/home_screen.dart';

import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Reclamacao> favorites = [];
  List<Reclamacao> myCart = [];

  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const AddSolicitacao(),
                  type: PageTransitionType.bottomToTop));
        },
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30.0,
        ),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
