class Canciones {
  String id;
  String name;
  String albumName;
  String artistas;
  String urlImage;
  String duration;
  bool favorito = false;

  Canciones({
    required this.id,
    required this.name,
    required this.albumName,
    required this.artistas,
    required this.urlImage,
    required this.duration,
  });

  factory Canciones.fromMap(Map<String, dynamic> json) => Canciones(
        id: json['id'],
        name: json['name'],
        albumName: json['albumName'],
        artistas: json['artistas'],
        urlImage: json['url'],
        duration: json['duration'],
      );
}
