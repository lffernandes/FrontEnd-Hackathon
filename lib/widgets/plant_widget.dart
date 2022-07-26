import 'package:flutter/material.dart';
import 'package:flutter_app_reclame_ja/models/enum/reclamacaotipo.dart';
import 'package:flutter_app_reclame_ja/models/reclamacoes.dart';
import 'package:flutter_app_reclame_ja/screens/detail_page.dart';

import 'package:page_transition/page_transition.dart';

import '../constants.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({
    Key? key,
    required this.index,
    required this.reclamacoesList,
  }) : super(key: key);

  final int index;
  final List<Reclamacao> reclamacoesList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailPage(
                  idReclamacao: reclamacoesList[index].idReclamacao.toString(),
                  tipo: reclamacoesList[index].tipo.toString(),
                  idPedido: reclamacoesList[index].idPedido.toString(),
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.8),
                    shape: BoxShape.circle,
                  ),
                ),
                // Positioned(
                //   bottom: 5,
                //   left: 0,
                //   right: 0,
                //   child: SizedBox(
                //     height: 80.0,
                //     child: Image.asset(reclamacoesList[index].imageURL),
                //   ),
                // ),
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(reclamacoesList[index].tipo.toString()),
                      Text(
                        reclamacoesList[index].descricao.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Constants.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
