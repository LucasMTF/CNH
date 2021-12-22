import 'package:flutter/material.dart';
import 'package:treinamento3/calculo_idade_page.dart';

class CadastroPessoaPage extends StatefulWidget {
  const CadastroPessoaPage({Key? key, required this.title1}) : super(key: key);

  final String title1;

  @override
  _CadastroPessoaPageState createState() => _CadastroPessoaPageState();
}

class _CadastroPessoaPageState extends State<CadastroPessoaPage> {
  late final String title1;

  final nome1Controller = TextEditingController();
  final nome2Controller = TextEditingController();
  bool cadastro = true;

  var nome1 = '';
  var nome2 = '';

  _definirNomes() {
    nome1 = (nome1Controller.text);
    nome2 = (nome2Controller.text);

    cadastro = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: cadastro,
      replacement: CalculoIdadePage(
        nome1: nome1,
        nome2: nome2,
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title1),
          ),
          body: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: TextField(
                    controller: nome2Controller,
                    decoration: InputDecoration(labelText: 'Nome 1'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: TextField(
                    controller: nome1Controller,
                    decoration: InputDecoration(labelText: 'Nome 2'),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _definirNomes,
                      child: Text('Definir Nomes'),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}