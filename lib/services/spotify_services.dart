import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_final/models/spotify_model.dart';

class SpotifyServices extends ChangeNotifier {
  final String _urlBase = 'spotify23.p.rapidapi.com';
  final String _apiKey = '9a9eaa7854msh1d9684f5ed5c98bp195618jsna0515f52f93c';

  List<Canciones> cancionesBuscadas = [];
  List<Canciones> cancionesRegresadas = [];
  List<Canciones> cancionesFavoritas = [];
  late Canciones cancionActual;
  Map infoCanciones = {};
  String track = '';
  bool liked = false;
  late int miliseconds;
  String timeFormat = '';
  int indexBar = 0;
  String nombresCombinados = '';

  changeIndexBar(int valor) {
    indexBar = valor;
    notifyListeners();
  }

  changeTrack(String valor) {
    track = valor;
    notifyListeners();
    //print(track);
  }

  isfavorite(Canciones cancion) {
    if (cancion.favorito) {
      cancion.favorito = false;
      cancionesFavoritas.removeWhere(((element) => element.id == cancion.id));
    } else {
      cancion.favorito = true;
      cancionesFavoritas.add(cancion);
    }
    for (int i = 0; i < cancionesFavoritas.length; i++) {
      print(cancionesFavoritas[i].name);
    }

    notifyListeners();
  }

  clearCancionesRegresados() {
    cancionesRegresadas = [];
    notifyListeners();
  }

  SpotifyServices();

  getService() async {
    final url = Uri.https(_urlBase, '/search/', {
      'q': track,
      'type': 'tracks',
      'offset': '0',
      'limit': '5',
      'numberOfTopResults': '1'
    });
    //print(track);

    final respuesta = await http.get(url,
        headers: {'X-RapidAPI-Host': _urlBase, 'X-RapidAPI-Key': _apiKey});

    Map jCompleto = jsonDecode(respuesta.body);
    //Creamos la lista que contendra la informacion de las canciones y la guardamos
    List jItems = jCompleto['tracks']['items'];

    //Creamos una lista de nombres
    List artistsItems = jItems[0]['data']['artists']['items'];
    List artistsNames = [];

    artistsItems.forEach((e) {
      artistsNames.add(e['profile']['name']);
    });
    String names = artistsNames.join(", ");

    //Regresa la duracion de la cancion

    miliseconds = jItems[0]['data']['duration']['totalMilliseconds'];

    Duration duration = Duration(milliseconds: miliseconds);
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds.remainder(60);

    timeFormat = "$minutes:$seconds";

    cancionesRegresadas = [];
    //Metodo para guardar la informarcion de las canciones
    jItems.forEach((e) {
      Canciones canciones = Canciones(
          id: e['data']['id'],
          name: e['data']['name'],
          albumName: e['data']['albumOfTrack']['name'],
          artistas: '', //names,
          duration: timeFormat,
          urlImage: e['data']['albumOfTrack']['coverArt']['sources'][1]['url']);

      cancionesRegresadas.add(canciones);
    });

    for (int i = 0; i < cancionesRegresadas.length; i++) {
      List nombres = jItems[i]['data']['artists']['items'];
      List<String> aux = [];
      nombres.forEach((nombre) {
        aux.add(nombre['profile']['name']);
      });
      nombresCombinados = aux.join(", ");
      cancionesRegresadas[i].artistas = nombresCombinados;
    }
    notifyListeners();
    //print(cancionActual.name);

    //Creamos nuestro mapa perzonalizado con los datos que nos intersan
    /*infoCanciones = {
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
    */
  }

  bool contieneDuplicados(String valor) {
    for (int i = 0; i < cancionesBuscadas.length; i++) {
      if (cancionesBuscadas[i].id == valor) {
        return true;
      }
    }
    return false;
  }
}
