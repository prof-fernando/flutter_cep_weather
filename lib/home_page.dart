import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cepController = TextEditingController();
  Map? dados;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta CEP'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: cepController,
              decoration: const InputDecoration(
                labelText: 'CEP:',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                buscaCepViaAPI(cepController.text);
              },
              child: const Text('Pesquisa'),
            ),
            Text('${dados["localidade"]}')
          ],
        ),
      ),
    );
  }

  buscaCepViaAPI(String cep) {
    Uri url = Uri.parse('http://viacep.com.br/ws/$cep/json');
    http.get(url).then((resposta) {
      Map dados = jsonDecode(resposta.body);

      print('A cidade é ${dados["localidade"]}');
    });
  }
}
