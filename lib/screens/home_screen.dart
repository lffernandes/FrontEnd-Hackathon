import 'package:flutter/material.dart';
import 'package:flutter_app_reclame_ja/models/reclamacoes.dart';
import 'package:flutter_app_reclame_ja/screens/detail_page.dart';
import 'package:flutter_app_reclame_ja/widgets/plant_widget.dart';

import 'package:page_transition/page_transition.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Reclamacao> _reclamacoesList = Reclamacao.reclamacoesList;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
            child: const Text(
              'Reclamações',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: size.height,
            child: ListView.builder(
                itemCount: _reclamacoesList.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailPage(
                                  idReclamacao:
                                      _reclamacoesList[index].toString(),
                                  tipo: _reclamacoesList[index].tipo.toString(),
                                  idPedido: _reclamacoesList[index]
                                      .idPedido
                                      .toString(),
                                ),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: PlantWidget(
                          index: index, reclamacoesList: _reclamacoesList));
                }),
          ),
        ],
      ),
    ));
  }
}
