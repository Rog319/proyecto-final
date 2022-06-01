import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/models/spotify_model.dart';

import '../services/spotify_services.dart';

class TracksRegresadas extends StatelessWidget {
  Canciones cancion;
  TracksRegresadas(this.cancion, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyServices = Provider.of<SpotifyServices>(context);
    return InkWell(
      onTap: () {
        spotifyServices.cancionActual = cancion;
        if (spotifyServices.contieneDuplicados(cancion.id) == false) {
          spotifyServices.cancionesBuscadas.add(cancion);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 20,
                      right: 20,
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(cancion.urlImage),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 45, bottom: 10),
                        child: Text(
                          cancion.name,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(cancion.artistas,
                            style: const TextStyle(fontSize: 12)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, right: 15),
                  child: Text(
                    cancion.duration,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, right: 20),
                  child: IconButton(
                    icon: Icon(
                      !cancion.favorito
                          ? Icons.favorite_border
                          : Icons.favorite,
                    ),
                    color: Colors.deepPurple,
                    tooltip: 'Guardar cancion',
                    onPressed: () {
                      spotifyServices.isfavorite(cancion);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
