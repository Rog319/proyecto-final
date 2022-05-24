import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/spotify_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyServices = Provider.of<SpotifyServices>(context);
    /*if (spotifyServices.propiedadesCanciones.isEmpty) {
      return Container(
        color: Colors.grey.shade300,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.lightBlue,
          ),
        ),
      );
    }*/
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina principal'),
      ),
      body: ListView.builder(
        itemCount: spotifyServices.propiedadesCanciones.length,
        itemBuilder: (context, i) {
          return ListTile(
            subtitle: Text(
                'Artista: ' + spotifyServices.propiedadesCanciones[i].name),
            title: const Text('Cancion: DAKITI'),
          );
        },
      ),
    );
  }
}
