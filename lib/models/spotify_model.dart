class Canciones {
  String id;
  String name;
  String albumName;
  String artistas;

  Canciones({
    required this.id,
    required this.name,
    required this.albumName,
    required this.artistas,
  });

  factory Canciones.fromMap(Map<String, dynamic> json) => Canciones(
        id: json['id'],
        name: json['name'],
        albumName: json['albumName'],
        artistas: json['artistas'],
      );
}
