import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/pages/history.dart';
import 'package:proyecto_final/pages/home_contenido.dart';
import 'package:proyecto_final/pages/tracks_saved.dart';
import '../services/spotify_services.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyServices = Provider.of<SpotifyServices>(context);
    final pantallas = [
      const HomeContenido(),
      const History(),
      const TracksSaved()
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('WikiMusic'),
        backgroundColor: Colors.deepPurple,
      ),
      body: pantallas[spotifyServices.indexBar],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: spotifyServices.indexBar,
          onTap: (index) => spotifyServices.changeIndexBar(index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Historial',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: 'Mis canciones',
            ),
          ]),
    );
  }
}
