import 'package:flutter/material.dart';

class CalculoIdadePage extends StatefulWidget {
  final String nome1;
  final String nome2;

  const CalculoIdadePage({Key? key, required this.nome1, required this.nome2})
      : super(key: key);

  @override
  State<CalculoIdadePage> createState() => _CalculoIdadePageState();
}

class _CalculoIdadePageState extends State<CalculoIdadePage> {
  final alturaNome1Controller = TextEditingController();
  final alturaNome2Controller = TextEditingController();
  final crescimentoNome1Controller = TextEditingController();
  final crescimentoNome2Controller = TextEditingController();
  
  String texto = " ";
  int qtAnos = 0;

  _calcular() {
    var alturaNome1 = double.parse(alturaNome1Controller.text);
    var alturaNome2 = double.parse(alturaNome2Controller.text);
    var crescimentoNome2 = double.parse(crescimentoNome2Controller.text);
    var crescimentoNome1 = double.parse(crescimentoNome1Controller.text);

    if(alturaNome1 > alturaNome2){
      while (alturaNome1 > alturaNome2) {
            alturaNome1 += crescimentoNome1;
            alturaNome2 += crescimentoNome2;
            qtAnos++;
      }
      texto = '${widget.nome2} demorou $qtAnos para passar a altura de ${widget.nome1}';
    }else if (alturaNome1 < alturaNome2){
      while (alturaNome1 < alturaNome2) {
        alturaNome1 += crescimentoNome1;
        alturaNome2 += crescimentoNome2;
        qtAnos++;
        texto = '${widget.nome1} demorou $qtAnos para passar a altura de ${widget.nome2}';
      }
    }else{
      texto = 'Ambos tem o mesmo crescimento e altura';
    }

    setState(() {});
    qtAnos = 0;
  }

  @override
  Widget build(BuildContext context) {
    String nome1 = widget.nome1;
    String nome2 = widget.nome2;
    return Scaffold(
      appBar: AppBar(
        title: Text('treinamento3'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: TextField(
                controller: alturaNome1Controller,
                decoration: InputDecoration(labelText: 'Altura $nome1'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: TextField(
                controller: alturaNome2Controller,
                decoration: InputDecoration(labelText: 'Altura $nome2'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: TextField(
                controller: crescimentoNome1Controller,
                decoration: InputDecoration(labelText: 'Crescimento $nome1'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: TextField(
                controller: crescimentoNome2Controller,
                decoration: InputDecoration(labelText: 'Crescimento $nome2'),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _calcular,
                  child: Text('Calcular'),
                )
              ],
            ),
            Text(
              texto,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}