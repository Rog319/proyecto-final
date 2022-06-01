import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/pages/history.dart';
import 'package:proyecto_final/pages/home_contenido.dart';
import 'package:proyecto_final/pages/tracks_saved.dart';
import 'package:proyecto_final/widgets/search_bar.dart';
import 'package:proyecto_final/widgets/search_buttom.dart';
import '../services/spotify_services.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyServices = Provider.of<SpotifyServices>(context);
    //String busqueda = '';
    int currentIndex = 0;
    final pantallas = [
      const HomeContenido(),
      const History(),
      const TracksSaved()
    ];
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
        title: const Text('WikiMusic'),
      ),
      body: pantallas[spotifyServices.indexBar],
      /*Center(
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
            spotifyServices.cancionActual.isEmpty
                ? Container()
                : Expanded(
                    child: ListView.builder(
                      itemCount: spotifyServices.cancionActual.length,
                      itemBuilder: (context, i) {
                        return const Tracks();
                      },
                    ),
                  ),
          ],
        ),
      ),*/
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

      /*ListView.builder(
        itemCount: spotifyServices.propiedadesCanciones.length,
        itemBuilder: (context, i) {
          return ListTile(
            subtitle: Text('Artista/s: ' +
                spotifyServices.propiedadesCanciones[0].artistas),
            title: Text('Nombre de la canción: ' +
                spotifyServices.propiedadesCanciones[0].name),
            onTap: () => spotifyServices.busqueda = busqueda,
          );
        },
      ),*/
    );
  }
}
