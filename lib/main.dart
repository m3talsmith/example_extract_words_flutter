import 'package:extract_words/extract_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.amber, useMaterial3: true),
      title: 'Extract Words',
      home: _Display(),
    );
  }
}

class _Display extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DisplayState();
}

class _DisplayState extends State<_Display> {
  String _input = "";
  List<String> _words = [];

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Extract Words'), centerTitle: true),
      body: Column(
        children: [
          TextField(
            autocorrect: false,
            autofocus: true,
            onChanged: (value) => setState(() => _input = value),
          ),
          ElevatedButton.icon(
              onPressed: () => setState(() => _words = extractWords(_input)),
              icon: const Icon(Icons.chevron_right_rounded),
            label: const Text('Extract'),
          ),
          Text(_words.join(", ")),
        ],
      ),
    );
  }
}
