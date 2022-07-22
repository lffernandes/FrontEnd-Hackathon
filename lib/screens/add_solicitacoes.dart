import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';

class AddSolicitacao extends StatefulWidget {
  const AddSolicitacao({Key? key}) : super(key: key);

  @override
  State<AddSolicitacao> createState() => _AddSolicitacaoState();
}

class _AddSolicitacaoState extends State<AddSolicitacao>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Solicitação'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: "Número do Pedido"),
                validator: (String? txt) {
                  if (txt == null || txt.isEmpty) {
                    return "Por favor inserir Número do Pedido";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
          )),
        ),
      ),
    );
  }
}
