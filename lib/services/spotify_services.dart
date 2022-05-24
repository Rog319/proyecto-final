import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_final/models/spotify_model2.dart';

class SpotifyServices extends ChangeNotifier {
  final String _urlBase = 'spotify23.p.rapidapi.com';
  final String _apiKey = '9a9eaa7854msh1d9684f5ed5c98bp195618jsna0515f52f93c';

  List<Canciones2> propiedadesCanciones = [];
  SpotifyServices() {
    getService();
  }

  getService() async {
    final url = Uri.https(_urlBase, '/search/', {
      'q': 'Dakiti',
      'type': 'tracks',
      'offset': '0',
      'limit': '1',
      'numberOfTopResults': '1'
    });

    final respuesta = await http.get(url,
        headers: {'X-RapidAPI-Host': _urlBase, 'X-RapidAPI-Key': _apiKey});

    print(respuesta.body);

    //Map tracks = jsonDecode(respuesta.body);

    /*
    Map album = tracks['tracks'][0];
    Map albumInfo = album['album'];
    List artists = albumInfo['artists'];

    for (var i = 0; i < artists.length; i++) {
      Canciones2 canciones2 =
          Canciones2(id: artists[i]['id'], name: artists[i]['name']);
      propiedadesCanciones.add(canciones2);
    }
    notifyListeners();*/
  }
}
