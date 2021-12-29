import 'package:flutter/material.dart';
import 'package:tela/app/views/app_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class TelaMapa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TelaMapaState();
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  //verificar se está ativada
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error("Serviço de localização desativado");
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Serviço de localização desativado");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        "Acesso à localização negado permanentemente, altere nas configurações do seu dispositivo");
  }

  return await Geolocator.getCurrentPosition();
}

Position localizacao;

//criada uma classe para retornar, que funciona apenas para a classe que precisa de um state.
class TelaMapaState extends State<TelaMapa> {
  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();

  double lat = 45.521563;
  double long = -122.677433;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/image/livreseLogo.png',
                fit: BoxFit.contain,
                height: 35,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 60),
                  child: Text('LIVRE-SE'))
            ],
          ),
        ),
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/image/avatarTcc.png'),
                    ),
                    SizedBox(height: 10),
                    Text('Nicole M. S.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(
                      height: 2,
                    ),
                    Text('17 anos', style: TextStyle(fontSize: 12)),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Expanded(
                          flex: 5,
                          child: Card(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/image/livros.jpeg',
                                  height: 44,
                                ),
                                Padding(padding: const EdgeInsets.only(top: 6)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Total adicionados:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ),
                                SizedBox(height: 4),
                                Text('Você adicionou 0'),
                                SizedBox(height: 2),
                                Text('livros, e 0 anotações!'),
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Card(
                              child: Column(
                            children: [
                              Icon(
                                Icons.favorite_rounded,
                                color: Colors.red,
                                size: 44,
                              ),
                              Padding(padding: const EdgeInsets.only(top: 15)),
                              Padding(
                                padding: const EdgeInsets.all(.0),
                                child: Text('Categorias favoritas:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                              SizedBox(height: 4),
                              Text('Mais vistas ou add',
                                  style: TextStyle(fontSize: 10)),
                              SizedBox(height: 10),
                              Text('- Ação e aventura'),
                              SizedBox(height: 12),
                            ],
                          )),
                        ),
                        Spacer(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Livrarias próximas de você:',
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 200,
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        onCameraMove: (data) {
                          print(data);
                        },
                        onTap: (position) {
                          print(position);
                        },
                        initialCameraPosition: CameraPosition(
                            target: LatLng(lat, long), zoom: 11.0),
                        markers: markers,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          localizacao = await Geolocator.getCurrentPosition(
                              desiredAccuracy: LocationAccuracy.high);
                          print(localizacao);
                          lat = -22.7101448;
                          long = -48.0747667;

                          LatLng position = LatLng(
                              localizacao.latitude, localizacao.longitude);
                          mapController
                              .moveCamera(CameraUpdate.newLatLng(position));

                          print("Posição da camera: " + position.toString());

                          //colocando um marker:
                          final Marker marker = Marker(
                            markerId: new MarkerId("123456"),
                            position: position,
                            infoWindow: InfoWindow(
                              title: "Localização atual",
                            ),
                          );
                          setState(() {
                            markers.add(marker);
                          });
                        },
                        child: Icon(Icons.location_on_outlined))
                  ]),
            )),
      ),
    );
  }
}
