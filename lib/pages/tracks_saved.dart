import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/widgets/tracks_favoritas.dart';

import '../services/spotify_services.dart';

class TracksSaved extends StatelessWidget {
  const TracksSaved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyServices = Provider.of<SpotifyServices>(context);
    if (spotifyServices.cancionesFavoritas.isEmpty) {
      return const Text('No has agregado ninguna a favoritos');
    } else {
      return ListView.builder(
          itemCount: spotifyServices.cancionesFavoritas.length,
          itemBuilder: (context, index) {
            return TracksFavoritas(spotifyServices.cancionesFavoritas[index]);
          });
    }
  }
}
