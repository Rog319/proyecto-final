import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/widgets/tracks_regresadas.dart';

import '../services/spotify_services.dart';
import '../widgets/search_bar.dart';

class HomeContenido extends StatelessWidget {
  const HomeContenido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyServices = Provider.of<SpotifyServices>(context);
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pinimg.com/564x/84/2a/d6/842ad68b315b0f586c30b465221da609.jpg',
                  ),
                  fit: BoxFit.cover)),
        ),
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Bienvenid@ hecha un vistazo a nuestra biblioteca',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SearchBar(),
                ]),
              ),
              spotifyServices.cancionesRegresadas.isEmpty
                  ? Container()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: spotifyServices.cancionesRegresadas.length,
                        itemBuilder: (context, i) {
                          return TracksRegresadas(
                              spotifyServices.cancionesRegresadas[i]);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
