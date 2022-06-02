import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/services/spotify_services.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackInfo extends StatelessWidget {
  const TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyServices = Provider.of<SpotifyServices>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Información de la canción')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                    child:
                        Image.network(spotifyServices.cancionActual.urlImage),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Nombre de la canción',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  spotifyServices.cancionActual.name,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Artista/s',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  spotifyServices.cancionActual.artistas,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Nombre del álbum',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  spotifyServices.cancionActual.albumName,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Duración de la canción',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  spotifyServices.cancionActual.duration,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          ElevatedButton(
            child: const Text('Reproducir canción'),
            onPressed: () async {
              String id = spotifyServices.cancionActual.id;
              final Uri url = Uri.parse('https://open.spotify.com/track/$id');

              if (await canLaunchUrl(url)) {
                await launchUrl(
                  url,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
