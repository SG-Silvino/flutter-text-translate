import 'package:flutter/material.dart';
import 'package:text_translate/textTranslateWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextTranslate(
          'Meu título',
          from: 'pt',
          to: 'fr',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextTranslate('How are you?', from: 'en', to: 'es'),
            TextTranslate('Traduzindo para inglês por defeito'),
            TextTranslate(
              'Detentando linguagem automaticamente',
              to: 'it',
            )
          ],
        ),
      ),
    );
  }
}
