import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  String nome = '';
  String idade = '';

  Widget _body() {
    return SingleChildScrollView(
        child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.asset("assets/image/livreseLogo.png"),
            ),
            SizedBox(height: 80),
            Container(
              width: 60,
              height: 60,
              child: Image.asset("assets/image/avatarTcc.png"),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12, top: 20, bottom: 20),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (text) {
                        nome = text;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'NOME',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      onChanged: (text) {
                        idade = text;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'IDADE',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      textColor: Colors.black,
                      color: Colors.blue[900],
                      onPressed: () {
                        if (nome.length >= 1 &&
                            idade.length >= 2 &&
                            idade.length < 3) {
                          Navigator.of(context)
                              .pushReplacementNamed('/telaPrincipal');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Cadastrar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/image/fundoTcc.jpg",
              fit: BoxFit.cover,
            ),
          ),
          _body(),
        ],
      ),
    );
  }
}
