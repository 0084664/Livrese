import 'package:flutter/material.dart';
import 'package:tela/app/views/tela_mapa.dart';

class TelaAnotacoesNaruto extends StatefulWidget {
  @override
  _TelaAnotacoesState createState() => _TelaAnotacoesState();
}

class _TelaAnotacoesState extends State<TelaAnotacoesNaruto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('LIVRE-SE'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TelaMapa()));
              },
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Image.asset("assets/image/naruto.jpg"),
                ),
              ),
            ),
            Text(
              "Naruto",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Masashi Kishimoto"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _avaliacoes(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Sinopse:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
              child: Text(
                "Naruto é um jovem órfão habitante da Vila da Folha que sonha se tornar o quinto Hokage, o maior guerreiro e governante da vila. ... Agora Naruto vai contar com a ajuda dos colegas Sakura e Sasuke e do professor dos três, Kakashi Hatake, para perseguir seu sonho e deter os ninjas que planejam fazer mal á sua cidade.",
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              indent: 12.0,
              endIndent: 12.0,
              thickness: 2.0,
              color: Colors.blue[200],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(Icons.sticky_note_2_outlined),
                      Text(" Anotações:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start),
                    ],
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: _anotacoes(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: _anotacoes(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: _anotacoes(),
            ),
          ],
        )
      ]),
    );
  }

  Widget _avaliacoes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star_rounded,
          color: Colors.orange[300],
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.orange[300],
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.orange[300],
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.orange[300],
        ),
        Icon(Icons.star_border_rounded),
      ],
    );
  }

  Widget _anotacoes() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.favorite_border),
                Text(
                  " Gostei muito",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Container(height: 6),
            ),
            Text(
                "Adaptação do livro de Ray Bradbury sobre uma sociedade do futuro que baniu todos os materiais de leitura e o trabalho dos bombeiros de manter as fogueiras a 451 graus: a temperatura que o papel queima. Um bombeiro começa a repensar sua função ao conhecer uma jovem encantadora que adora livros.",
                style: TextStyle(color: Colors.grey[700]))
          ],
        ),
      ),
    );
  }
}