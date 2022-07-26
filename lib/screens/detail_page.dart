import 'package:flutter/material.dart';
import 'package:flutter_app_reclame_ja/constants.dart';
import 'package:flutter_app_reclame_ja/models/reclamacoes.dart';

class DetailPage extends StatefulWidget {
  final String idReclamacao;
  final String tipo;
  final String idPedido;
  const DetailPage(
      {Key? key,
      required this.idReclamacao,
      required this.tipo,
      required this.idPedido})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  //Toggle add remove from cart
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Reclamacao> _reclamacoesList = Reclamacao.reclamacoesList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ReclamacaoFeature(
                          //   title: 'Protocolo Atendimento',
                          //   reclamacaoFeature:
                          //       _reclamacoesList[widget.idReclamacao]
                          //           .idReclamacao
                          //           .toString(),
                          // ),
                          // ReclamacaoFeature(
                          //   title: 'Tipo',
                          //   reclamacaoFeature:
                          //       _reclamacoesList[widget.tipo].tipo.toString(),
                          // ),
                          // ReclamacaoFeature(
                          //   title: 'Nº do Pedido',
                          //   reclamacaoFeature: _reclamacoesList[widget.idPedido]
                          //       .idPedido
                          //       .toString(),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReclamacaoFeature extends StatelessWidget {
  final String reclamacaoFeature;
  final String title;
  const ReclamacaoFeature({
    Key? key,
    required this.reclamacaoFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toString(),
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          reclamacaoFeature.toString(),
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
