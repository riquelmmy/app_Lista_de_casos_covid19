import 'package:flutter/material.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Casos Diarios'),
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            var showData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/img/covid19.jpeg'),
                    ),
                  ),
                  title: Text(showData[index]['data']),
                  subtitle: Text('Casos Confirmados:  ' +
                      showData[index]['casos_novos_confirmados'].toString() +
                      '\nNovos Casos de Obtos: ' +
                      showData[index]['obitos_novos_confirmados'].toString()),
                );
              },
              itemCount: showData.length,
            );
          },
          future:
              DefaultAssetBundle.of(context).loadString("assets/casos.json"),
        ),
      ),
    );
  }
}
