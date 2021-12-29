import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tela/app/models/livro_model.dart';
import 'package:tela/app/views/anotacoes_lgbtq/tela_anotacoes_call.dart';
import 'package:tela/app/views/anotacoes_lgbtq/tela_anotacoes_milhao.dart';
import 'package:tela/app/views/anotacoes_lgbtq/tela_anotacoes_terceiro.dart';
import 'package:tela/app/views/anotacoes_lgbtq/tela_anotacoes_vermelho.dart';
import 'package:tela/app/views/tela_mapa.dart';
import 'package:tela/app/views/tela_principal.dart';

class TelaLivrosLgbtq extends StatefulWidget {
  TelaLivrosLgbtq({Key key}) : super(key: key);

  @override
  _TelaLivrosState createState() => _TelaLivrosState();
}

class _TelaLivrosState extends State<TelaLivrosLgbtq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          leadingWidth: 40,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TelaPrincipal())),
              child: Image.asset(
                "assets/image/livreseLogo.png",
              ),
            ),
          ),
          title: Text('LIVRE-SE'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TelaMapa()));
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ))
          ],
        ),
        body: ListView(children: [
          Column(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24.0),
              child: Positioned(child: _buscaLivros()),
            ),
            Positioned(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "LGBTQIA+",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
            Positioned(child: _filtro()),
            Positioned(child: _listaLivros1()),
            Positioned(child: _listaLivros2()),
            Positioned(child: _listaLivros3()),
            Positioned(child: _listaLivros4()),
          ]),
        ]));
  }

  Widget _listaLivros1() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: GestureDetector(
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TelaAnotacoesMilhao())),
          child: _constroiLinha1()),
    );
  }

  Widget _listaLivros2() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: GestureDetector(
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TelaAnotacoesCall())),
          child: _constroiLinha2()),
    );
  }

  Widget _listaLivros3() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: GestureDetector(
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TelaAnotacoesTerceiro())),
          child: _constroiLinha3()),
    );
  }

  Widget _listaLivros4() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: GestureDetector(
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TelaAnotacoesVermelho())),
          child: _constroiLinha4()),
    );
  }

  Widget _constroiLinha1() {
    Livro livro = new Livro(autor: '', titulo: '');
    livro = livro.livroMock();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Row(children: [
        Container(
          height: 75,
          child: Image.asset("assets/image/ummilhao.jpg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Um Milhão De Finais Felizes",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Vitor Martins"),
              SizedBox(
                child: Container(height: 22),
              ),
              Text(
                "3 anotações",
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
        )
      ])),
    );
  }

  Widget _constroiLinha2() {
    Livro livro = new Livro(autor: '', titulo: '');
    livro = livro.livroMock();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Row(children: [
        Container(
          height: 75,
          child: Image.asset("assets/image/call.jpg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Call Me By Your Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("André Aiman"),
              SizedBox(
                child: Container(height: 22),
              ),
              Text(
                "3 anotações",
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
        )
      ])),
    );
  }

  Widget _constroiLinha3() {
    Livro livro = new Livro(autor: '', titulo: '');
    livro = livro.livroMock();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Row(children: [
        Container(
          height: 75,
          child: Image.asset("assets/image/oterceiro.jpg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "O Terceiro Travesseiro",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Nelson Luiz De Carvalho"),
              SizedBox(
                child: Container(height: 22),
              ),
              Text(
                "3 anotações",
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
        )
      ])),
    );
  }

  Widget _constroiLinha4() {
    Livro livro = new Livro(autor: '', titulo: '');
    livro = livro.livroMock();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Row(children: [
        Container(
          height: 75,
          child: Image.asset("assets/image/vermelho.jpg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vermelho Branco e Sangue Azul",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Casey McQuiston"),
              SizedBox(
                child: Container(height: 22),
              ),
              Text(
                "3 anotações",
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
        )
      ])),
    );
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

  Widget _filtro() {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0),
      child: Row(
        children: [Icon(Icons.sort), Text("Filtro")],
      ),
    );
  }
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
