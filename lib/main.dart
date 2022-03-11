import 'package:flutter/material.dart';
import 'package:text_translate/supabase.dart';
import 'package:text_translate/textTranslateWidget.dart';

void main() async {
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
  base() async {
    var response = await client.from('cvLocales').select().execute();

    return response.data;
  }

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
            FutureBuilder(
              future: base(),
              builder: (context, snapshot) {
              return Text("${snapshot.data}");
            }),
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
