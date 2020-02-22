import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerador de nomes',
      home: PalavrasAleatorias(),
    );
  }
}

class PalavrasAleatoriasState extends State<PalavrasAleatorias> {
  final _sugestoes = <WordPair>[];
  final _fonteGrande = const TextStyle(fontSize: 18.0);

  Widget _buildLinha(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _fonteGrande,
      ),
    );
  }

  Widget _buildSugestoes() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _sugestoes.length) {
          _sugestoes.addAll(generateWordPairs().take(10));
        }
        return _buildLinha(_sugestoes[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerador de nomes maneiros'),
      ),
      body: _buildSugestoes(),
    );
  }
}

class PalavrasAleatorias extends StatefulWidget {
  @override
  PalavrasAleatoriasState createState() => PalavrasAleatoriasState();
}
