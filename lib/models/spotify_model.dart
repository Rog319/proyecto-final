// To parse this JSON data, do
//
//     final canciones = cancionesFromMap(jsonString);

import 'dart:convert';

class Canciones {
  Canciones({
    this.tracks,
  });

  List<Cancion>? tracks;

  factory Canciones.fromJson(String str) => Canciones.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Canciones.fromMap(Map<String, dynamic> json) => Canciones(
        tracks:
            List<Cancion>.from(json["tracks"].map((x) => Cancion.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "tracks": List<dynamic>.from(tracks!.map((x) => x.toMap())),
      };
}

class Cancion {
  Cancion({
    required this.album,
    required this.artists,
    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.externalIds,
    required this.externalUrls,
    required this.id,
    required this.isLocal,
    required this.isPlayable,
    required this.name,
    required this.popularity,
    required this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
  });

  Album album;
  List<Artist>? artists;
  int discNumber;
  int durationMs;
  bool explicit;
  ExternalIds externalIds;
  ExternalUrls externalUrls;
  String id;
  bool isLocal;
  bool isPlayable;
  String name;
  int popularity;
  String previewUrl;
  int trackNumber;
  String type;
  String uri;

  factory Cancion.fromJson(String str) => Cancion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cancion.fromMap(Map<String, dynamic> json) => Cancion(
        album: Album.fromMap(json["album"]),
        artists:
            List<Artist>.from(json["artists"].map((x) => Artist.fromMap(x))),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalIds: ExternalIds.fromMap(json["external_ids"]),
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        id: json["id"],
        isLocal: json["is_local"],
        isPlayable: json["is_playable"],
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toMap() => {
        "album": album.toMap(),
        "artists": List<dynamic>.from(artists!.map((x) => x.toMap())),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_ids": externalIds.toMap(),
        "external_urls": externalUrls.toMap(),
        "id": id,
        "is_local": isLocal,
        "is_playable": isPlayable,
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
      };
}

class Album {
  Album({
    required this.albumType,
    required this.artists,
    required this.externalUrls,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.totalTracks,
    required this.type,
    required this.uri,
  });

  String albumType;
  List<Artist>? artists;
  ExternalUrls externalUrls;
  String id;
  List<Image>? images;
  String name;
  DateTime releaseDate;
  String releaseDatePrecision;
  int totalTracks;
  String type;
  String uri;

  factory Album.fromJson(String str) => Album.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Album.fromMap(Map<String, dynamic> json) => Album(
        albumType: json["album_type"],
        artists:
            List<Artist>.from(json["artists"].map((x) => Artist.fromMap(x))),
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        name: json["name"],
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toMap() => {
        "album_type": albumType,
        "artists": List<dynamic>.from(artists!.map((x) => x.toMap())),
        "external_urls": externalUrls.toMap(),
        "id": id,
        "images": List<dynamic>.from(images!.map((x) => x.toMap())),
        "name": name,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "type": type,
        "uri": uri,
      };
}

class Artist {
  Artist({
    required this.externalUrls,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  ExternalUrls externalUrls;
  String id;
  String name;
  String type;
  String uri;

  factory Artist.fromJson(String str) => Artist.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Artist.fromMap(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toMap() => {
        "external_urls": externalUrls.toMap(),
        "id": id,
        "name": name,
        "type": type,
        "uri": uri,
      };
}

class ExternalUrls {
  ExternalUrls({
    required this.spotify,
  });

  String spotify;

  factory ExternalUrls.fromJson(String str) =>
      ExternalUrls.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExternalUrls.fromMap(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toMap() => {
        "spotify": spotify,
      };
}

class Image {
  Image({
    required this.height,
    required this.url,
    required this.width,
  });

  int height;
  String url;
  int width;

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toMap() => {
        "height": height,
        "url": url,
        "width": width,
      };
}

class ExternalIds {
  ExternalIds({
    required this.isrc,
  });

  String isrc;

  factory ExternalIds.fromJson(String str) =>
      ExternalIds.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExternalIds.fromMap(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
      );

  Map<String, dynamic> toMap() => {
        "isrc": isrc,
      };
}
