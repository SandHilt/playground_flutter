import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seja bem vindo ao Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bem vindo ao Flutter, parceiro!'),
        ),
        body: Center(child: PalavrasAleatorias()),
      ),
    );
  }
}

class PalavrasAleatoriasState extends State<PalavrasAleatorias> {
 @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }  
}

class PalavrasAleatorias extends StatefulWidget {
  @override
  PalavrasAleatoriasState createState() => PalavrasAleatoriasState();
}
