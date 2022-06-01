import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/widgets/tracks_history.dart';
import 'package:proyecto_final/widgets/tracks_regresadas.dart';

import '../services/spotify_services.dart';
import '../widgets/search_bar.dart';

class HomeContenido extends StatelessWidget {
  const HomeContenido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyServices = Provider.of<SpotifyServices>(context);
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              const Text(
                'Busca la cancion que desees',
                style: TextStyle(fontSize: 25),
              ),
              //Text('Nombre de la cancion: ' +
              //  spotifyServices.propiedadesCanciones[0].name),
              /*FloatingActionButton(
                  onPressed: () {
                    spotifyServices.changeTrack(busqueda);
                    spotifyServices.getService();
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Tracks()),
                    );*/
                  },
                  child: const Icon(Icons.arrow_back),
                ),*/
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
    );
  }
}
