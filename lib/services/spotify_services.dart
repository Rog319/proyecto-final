import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_final/models/spotify_model.dart';

class SpotifyServices extends ChangeNotifier {
  final String _urlBase = 'spotify23.p.rapidapi.com';
  final String _apiKey = '9a9eaa7854msh1d9684f5ed5c98bp195618jsna0515f52f93c';

  List<Canciones> propiedadesCanciones = [];
  Map infoCanciones = {};

  SpotifyServices() {
    getService();
  }

  getService() async {
    final url = Uri.https(_urlBase, '/search/', {
      'q': 'dakiti',
      'type': 'tracks',
      'offset': '0',
      'limit': '1',
      'numberOfTopResults': '1'
    });

    final respuesta = await http.get(url,
        headers: {'X-RapidAPI-Host': _urlBase, 'X-RapidAPI-Key': _apiKey});

    Map jCompleto = jsonDecode(respuesta.body);
    Map jTracks = jCompleto['tracks'];
    List jItems = jTracks['items'];

    //Contiene la parte mas importante de informacion del Json
    Map jData = jItems[0]['data'];

    //Contendra la informacion del album de la cancion
    Map jAlbumInfo = jData['albumOfTrack'];

    //Sacamos la informacion de los artistas del json
    Map jArtistsInfo = jData['artists'];

    //Guardamos toda la informacion de cada artista en una lista
    List artists = jArtistsInfo['items'];

    //En un mapa guardamos el perfil que es donde esta la propiedad name
    Map profileArtists = {};

    //Creamos una lista de nombres
    List nameArtists = [];

    //Ciclo para sacar los artistas de la cancion y guardarlos en una lista
    for (var i = 0; i < artists.length; i++) {
      profileArtists = artists[i]['profile'];
      nameArtists.add(profileArtists['name']);
    }

    var artistas = nameArtists.join(", ");

    print(artistas);

    //Creamos nuestro mapa perzonalizado con los datos que nos intersan
    infoCanciones = {
      'id': jData['id'],
      'name': jData['name'],
      'albumName': jAlbumInfo['name'],
      'artistas': artistas
    };

    Canciones canciones = Canciones(
        id: infoCanciones['id'],
        name: infoCanciones['name'],
        albumName: infoCanciones['albumName'],
        artistas: infoCanciones['artistas']);

    propiedadesCanciones.add(canciones);
    notifyListeners();
    //print(infoCanciones['name']);

    /*
    Map album = tracks['tracks'][0];
    Map albumInfo = album['album'];
    List artists = albumInfo['artists'];

    for (var i = 0; i < artists.length; i++) {
      Canciones2 canciones2 =
          Canciones2(id: artists[i]['id'], name: artists[i]['name']);
      propiedadesCanciones.add(canciones2);
    }*/
  }
}
