import 'package:flutter/cupertino.dart';

// Grencia de estado. Aqui consiste em uma regra de negocio separada,
// que pode estar trabalhando junto das outras.

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDartTheme = false;
  changeTheme() {
    // muda para verdadeiro.
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}

// O ChangeNotifier é como se fosse um setState mas pra quem esta usando
// codigo de programação em si, e não com tela
