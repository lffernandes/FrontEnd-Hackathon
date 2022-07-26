import 'package:flutter_app_reclame_ja/models/enum/reclamacaostatus.dart';

import 'enum/reclamacaotipo.dart';

class Reclamacao {
  final String? idReclamacao;
  final ReclamacaoTipo tipo;
  final String idUsuario;
  final String? idPedido;
  final String? descricao;
  final DateTime dataReclamacao;
  final List<String> imagens;
  final String atendente;
  final List<String> historico;
  final ReclamacaoStatus status;
  bool isValid;
  bool isSelected;

  Reclamacao(
      {required this.idReclamacao,
      required this.tipo,
      required this.idUsuario,
      required this.idPedido,
      required this.descricao,
      required this.dataReclamacao,
      required this.imagens,
      required this.atendente,
      required this.historico,
      required this.status,
      required this.isValid,
      required this.isSelected});

  //List of Plants data
  static List<Reclamacao> reclamacoesList = [
    Reclamacao(
        idReclamacao: "0",
        tipo: ReclamacaoTipo.faltaProduto,
        idUsuario: "1",
        idPedido: "39293232",
        descricao: "Faltou 1 tênis do meu pedido",
        dataReclamacao: DateTime.utc(2022, DateTime.july, 22),
        imagens: [],
        atendente: '',
        historico: [],
        status: ReclamacaoStatus.emAndamento,
        isValid: true,
        isSelected: false)
  ];

  //Get the favorated items
  static List<Reclamacao> getIsValidReclamacoes() {
    List<Reclamacao> _abertosList = Reclamacao.reclamacoesList;
    return _abertosList.where((element) => element.isValid == true).toList();
  }

  //Get the cart items
  static List<Reclamacao> addedReclamacoes() {
    List<Reclamacao> _selectedPlants = Reclamacao.reclamacoesList;
    return _selectedPlants
        .where((element) => element.isSelected == true)
        .toList();
  }
}
