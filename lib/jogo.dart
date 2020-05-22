import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";
  var _vitoriaApp = 0;
  var _vitoriaUsuario = 0;
  var _empate = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var _opcoes = ['pedra', 'papel', 'tesoura'];
    var _numero = Random().nextInt(_opcoes.length);
    var _escolhaApp = _opcoes[_numero];

    //Exibição da imagem da opção App

    switch (_escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;

      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    // validação do vencedor
    // vitorias do usuario

    if (escolhaUsuario == "pedra" && _escolhaApp == "tesoura" ||
        escolhaUsuario == "papel" && _escolhaApp == "pedra" ||
        escolhaUsuario == "tesoura" && _escolhaApp == "papel") {
      this._mensagem = "Você venceu :)";
      this._vitoriaUsuario += 1;
    } else if (_escolhaApp == "papel" && escolhaUsuario == "pedra" ||
        _escolhaApp == "pedra" && escolhaUsuario == "tesoura" ||
        _escolhaApp == "tesoura" && escolhaUsuario == "papel") {
      this._mensagem = "App venceu :(";
      this._vitoriaApp += 1;
    } else {
      this._mensagem = "Empate :/";
      this._empate += 1;
    }
  }

  void reiniciaGame() {
    setState(() {
      this._imagemApp = AssetImage("images/padrao.png");
      this._mensagem = "Escolha uma opção abaixo";
      this._vitoriaApp = 0;
      this._vitoriaUsuario = 0;
      this._empate = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JoKenPô',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 16),
              child: Text(
                'Escolha do App',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image(
              image: this._imagemApp,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 22),
              child: Text(
                _mensagem,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _opcaoSelecionada('pedra'),
                  child: Image.asset(
                    'images/pedra.png',
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada('papel'),
                  child: Image.asset(
                    'images/papel.png',
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada('tesoura'),
                  child: Image.asset(
                    'images/tesoura.png',
                    height: 100,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Jogador: $_vitoriaUsuario',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Empate: $_empate',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.green),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'App: $_vitoriaApp',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.red),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: RaisedButton(
                    onPressed: reiniciaGame,
                    child: Text(
                      "Reiniciar Jogo",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    color: Colors.amber,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
