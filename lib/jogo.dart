import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imageApp = AssetImage('images/padrao.png');
  var _message = 'Escolha uma opção abaixo';

  void _opcaoSelecionada(String escolhaUser){
    var options = ['pedra', 'papel', 'tesoura'];
    var num = Random().nextInt(3);
    var escolhaApp = options[num];

    print('Escolha do App: ' + escolhaApp);
    print('Escolha User: ' + escolhaUser);

    switch( escolhaApp ){ //exibição da imagem escolhida pelo app
      case 'pedra' :
        setState(() {
          _imageApp = AssetImage('images/pedra.png');
        });
        break;
      case 'papel' :
        setState(() {
          _imageApp = AssetImage('images/papel.png');
        });
        break;
      case 'tesoura' :
        setState(() {
          _imageApp = AssetImage('images/tesoura.png');
        });
        break;
    }

    if(
          (escolhaUser == 'pedra' && escolhaApp == 'tesoura') ||
          (escolhaUser == 'papel' && escolhaApp == 'pedra') ||
          (escolhaUser == 'tesoura' && escolhaApp == 'papel')
    ){
      setState(() {
        _message = 'Parabéns!!! Você ganhou :)';
      });
    } else if(
        (escolhaApp == 'pedra' && escolhaUser == 'tesoura') ||
        (escolhaApp == 'papel' && escolhaUser == 'pedra') ||
        (escolhaApp == 'tesoura' && escolhaUser == 'papel')
    ){
      setState(() {
        _message = 'Você perdeu :(';
      });
    }else{
      setState(() {
        _message = 'Empatamos!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('JokenPo',
            style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            'Escolha do App',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          ),
          Image(image: _imageApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset('images/pedra.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset('images/papel.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset('images/tesoura.png', height: 100),
              )
              /*
              Image.asset('images/pedra.png', height: 100,),
              Image.asset('images/papel.png', height: 100,),
              Image.asset('images/tesoura.png', height: 100,)
              */
            ],
          )
        ],
      ),
    );
  }
}
