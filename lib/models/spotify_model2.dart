class Canciones2 {
  String id, name;

  Canciones2({required this.id, required this.name});

  factory Canciones2.fromMap(Map<String, dynamic> json) => Canciones2(
        id: json['id'],
        name: json['name'],
      );
}
