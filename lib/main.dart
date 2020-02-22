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
  final List<WordPair> _sugestoes = <WordPair>[];
  final Set<WordPair> _salvo = Set<WordPair>();
  final TextStyle _fonteGrande = const TextStyle(fontSize: 18.0);

  Widget _buildLinha(WordPair pair) {
    final bool jaSalvo = _salvo.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _fonteGrande,
      ),
      trailing: Icon(
        jaSalvo ? Icons.favorite : Icons.favorite_border,
        color: jaSalvo ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (jaSalvo) {
            _salvo.remove(pair);
          } else {
            _salvo.add(pair);
          }
        });
      },
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

  void _EmpurrarSalvos() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _salvo.map((WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _fonteGrande,
          ),
        );
      });
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('Sugestoes Salvas'),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerador de nomes'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _EmpurrarSalvos),
        ],
      ),
      body: _buildSugestoes(),
    );
  }
}

class PalavrasAleatorias extends StatefulWidget {
  @override
  PalavrasAleatoriasState createState() => PalavrasAleatoriasState();
}
