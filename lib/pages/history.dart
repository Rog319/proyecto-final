import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/widgets/tracks_history.dart';

import '../services/spotify_services.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyServices = Provider.of<SpotifyServices>(context);
    if (spotifyServices.cancionesBuscadas.isEmpty) {
      return const Text('Aun no hay historial');
    } else {
      return ListView.builder(
          itemCount: spotifyServices.cancionesBuscadas.length,
          itemBuilder: (context, index) {
            return TracksHistory(spotifyServices.cancionesBuscadas[index]);
          });
    }
  }
}
