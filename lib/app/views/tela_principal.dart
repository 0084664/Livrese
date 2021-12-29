import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tela/app/views/app_controller.dart';
import 'package:tela/app/views/tela_mapa.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

// precisa sempre criar uma classe que para que possa ser retornada,
// e funcionar como um estado que vai sempre ser modificado
// -------------------------------------------------------------------
// Principal diferença do StateFulWidget para o StatelessWidget é que o
// StateFulWidget consegue alterar algumas coisas enquanto o progrmaa roda.

class TelaPrincipal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TelaPrincipalState();
  }
}

//criada uma classe para retornar, que funciona apenas para a classe que precisa de um state.
class TelaPrincipalState extends State<TelaPrincipal> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            "assets/image/livreseLogo.png",
          ),
        ),
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
            Padding(padding: const EdgeInsets.only(top: 10)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24.0),
              //child: Positioned(
              child: _buscaLivros(),
            ),
            //Padding(padding: const EdgeInsets.only(top: 30)),
            Text('Categorias',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Padding(padding: const EdgeInsets.only(top: 40)),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Ordernar(),
              Padding(padding: const EdgeInsets.only(right: 150)),
              //Icon(Icons.add_circle),
              Padding(padding: const EdgeInsets.only(right: 20)),
            ]),
            Container(
              height: 15,
            ),
            Container(
              height: 50,
            ),
            Row(
              children: [Pasta1(), Pasta2(), Pasta3(), Pasta4()],
            ),
            Container(
              height: 50,
            ),
            Row(
              children: [Pasta5(), Pasta6(), Pasta7(), Pasta8()],
            ),
            Container(
              height: 50,
            ),
            SizedBox(height: 50),
          ],
        ),
      ]),
    );
  }
}

// Componentizando
class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // função que deixa o app escuro ou claro
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}

class AdicionarPasta extends StatelessWidget {
  final TextEditingController _controladorPasta = TextEditingController();
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nome da pasta: '),
      content: TextField(
        controller: _controladorPasta,
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancelar')),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Ok');
            final String _nomePasta = _controladorPasta.text;
            /*pasta(nome)*/
            log(_nomePasta);
          },
          child: const Text('Adicionar'),
        ),
      ],
    );
  }
}

class Pasta1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/telaLivrosAcao');
            },
            child: Container(
              padding: const EdgeInsets.only(left: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset("assets/image/pasta.jpeg",
                    width: 50.0, height: 50.0),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Padding(padding: const EdgeInsets.only(left: 50)),
          Column(
            children: [Text('Ação')],
          ),
        ],
      ),
    ]);
  }
}

class Pasta2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/telaLivrosAventura');
            },
            child: Container(
              padding: const EdgeInsets.only(left: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset("assets/image/pasta.jpeg",
                    width: 50.0, height: 50.0),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Padding(padding: const EdgeInsets.only(left: 50)),
          Column(
            children: [Text('Aventura')],
          ),
        ],
      ),
    ]);
  }
}

class Pasta3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/telaLivrosRomance');
            },
            child: Container(
              padding: const EdgeInsets.only(left: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset("assets/image/pasta.jpeg",
                    width: 50.0, height: 50.0),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Padding(padding: const EdgeInsets.only(left: 50)),
          Column(
            children: [Text('Romance')],
          ),
        ],
      ),
    ]);
  }
}

class Pasta4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed('/telaLivrosBiografia');
            },
            child: Container(
              padding: const EdgeInsets.only(left: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset("assets/image/pasta.jpeg",
                    width: 50.0, height: 50.0),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Padding(padding: const EdgeInsets.only(left: 50)),
          Column(
            children: [Text('Biografia')],
          ),
        ],
      ),
    ]);
  }
}

class Pasta5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/telaLivrosLgbtq');
            },
            child: Container(
              padding: const EdgeInsets.only(left: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset("assets/image/pasta.jpeg",
                    width: 50.0, height: 50.0),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Padding(padding: const EdgeInsets.only(left: 50)),
          Column(
            children: [Text('LGBTQIA+')],
          ),
        ],
      ),
    ]);
  }
}

class Pasta6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/telaLivrosAnime');
            },
            child: Container(
              padding: const EdgeInsets.only(left: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset("assets/image/pasta.jpeg",
                    width: 50.0, height: 50.0),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Padding(padding: const EdgeInsets.only(left: 50)),
          Column(
            children: [Text("Manga")],
          ),
        ],
      ),
    ]);
  }
}

class Pasta7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/telaLivrosCrime');
            },
            child: Container(
              padding: const EdgeInsets.only(left: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset("assets/image/pasta.jpeg",
                    width: 50.0, height: 50.0),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Padding(padding: const EdgeInsets.only(left: 50)),
          Column(
            children: [Text('Crime')],
          ),
        ],
      ),
    ]);
  }
}

class Pasta8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/telaLivrosTerror');
            },
            child: Container(
              padding: const EdgeInsets.only(left: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset("assets/image/pasta.jpeg",
                    width: 50.0, height: 50.0),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Padding(padding: const EdgeInsets.only(left: 50)),
          Column(
            children: [Text('Terror')],
          ),
        ],
      ),
    ]);
  }
}

Widget _buscaLivros() {
  return BuscaContainer(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Pesquisar",
          icon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

class BuscaContainer extends StatelessWidget {
  final Widget child;
  const BuscaContainer({
    Key key,
     this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(29),
          border: Border.all(color: Colors.grey)),
      child: child,
    );
  }
}

class Ordernar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text("Ordernar Por: Nome/Data")],
      ),
    ]);
  }
}

Future<http.Response> cadastro(String nome) {
  var url = "http://192.168.15.1:5000/cadastros";
  return http.put(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nome': nome,
    }),
  );
}

//componentizando

//criada uma classe para retornar, que funciona apenas para a classe que precisa de um state.

// GestureDetector = ele detecta quando a um clique em cima do texto.
// tambem possui um metodo "onTap" que pode colocar um metodo e que tudo,
// que clicar vai aparecer.
//----------------------------------------------------------------------
// para que as alterações possa aparecer na tela, precisa explicitamente dizer,
// que esse state sera modificado, usando o "setState"
// ---------------------------------------------------------------------------
// um single renders serve para criar um novo render assim nao sobrescrevendo
// o outro render. Um exemplo de single render é o "Center" ou "Align"
// ----------------------------------------------------------------------------
// Quando se tem muitos itens em uma column, é melhor usar uma ListView,
// que possui um scroll, assim facilitando colocar mais coisas na tela
// -----------------------------------------------------------------------------
// Scafold =  é um widget que tem praticamente pronto as telas, colocando as propriedades certas
// tais como "appBar, body, drawer..."
// -------------------------------------------------------------------------------
// alem do ClipRRect temos tambem o ClipOval que ja recorta automaticamente redondo.
// ------------------------------------------------------------------------------------
