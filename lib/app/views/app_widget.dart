import 'package:flutter/material.dart';
import 'package:tela/app/views/app_controller.dart';
import 'package:tela/app/views/anotacoes_acao/tela_anotacoes_codigo.dart';
import 'package:tela/app/views/anotacoes_acao/tela_anotacoes_1984.dart';
import 'package:tela/app/views/anotacoes_acao/tela_anotacoes_poder.dart';
import 'package:tela/app/views/anotacoes_acao/tela_anotacoes_rainha.dart';
import 'package:tela/app/views/livros/tela_livros_acao.dart';
import 'package:tela/app/views/livros/tela_livros_aventura.dart';
import 'package:tela/app/views/livros/tela_livros_romance.dart';
import 'package:tela/app/views/livros/tela_livros_biografia.dart';
import 'package:tela/app/views/livros/tela_livros_lgbtq.dart';
import 'package:tela/app/views/livros/tela_livros_anime.dart';
import 'package:tela/app/views/livros/tela_livros_crimes.dart';
import 'package:tela/app/views/livros/tela_livros_terror.dart';
import 'package:tela/app/views/tela_login.dart';
import 'package:tela/app/views/tela_mapa.dart';

import 'tela_principal.dart';

class AppWidget extends StatelessWidget {
  // StatelessWidget é um widgetque não mutavel, não tem alteração ,
  // não vai ter animação, nada que se altere, a não ser que o pai (AppWidget) se reconstrua.
  //------------------------------------------------------------------------------------------
  // podemos criar parametros pras classes por exemplo:
  //final String title;
  //const AppWidget({Key key, this.title}) : super(key: key);

  @override
  // dentro desse build é que vai ser construido/funcionar na tela
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.blueGrey,
              brightness: AppController.instance.isDartTheme
                  ? Brightness.dark
                  : Brightness.light),
          initialRoute: '/',
          //initialRoute: '/telaPrincipal',

          routes: {
            '/': (context) => TelaLogin(),
            '/telaPrincipal': (context) => TelaPrincipal(),
            '/telaMapa': (context) => TelaMapa(),
            '/telaLivrosAcao': (context) => TelaLivrosAcao(),
            '/telaLivrosAventura': (context) => TelaLivrosAventura(),
            '/telaLivrosRomance': (context) => TelaLivrosRomance(),
            '/telaLivrosBiografia': (context) => TelaLivrosBiografia(),
            '/telaLivrosLgbtq': (context) => TelaLivrosLgbtq(),
            '/telaLivrosAnime': (context) => TelaLivrosAnime(),
            '/telaLivrosCrime': (context) => TelaLivrosCrime(),
            '/telaLivrosTerror': (context) => TelaLivrosTerror(),
            '/telaAnotacoes_codigo': (context) => TelaAnotacoes_codigo(),
            '/telaAnotacoes_1984': (context) => TelaAnotacoes1984(),
            '/telaAnotacoes_poder': (context) => TelaAnotacoesPoder(),
            '/telaAnotacoes_rainha': (context) => TelaAnotacoesRainha(),
          },
        );
      },
    );
  }
}
