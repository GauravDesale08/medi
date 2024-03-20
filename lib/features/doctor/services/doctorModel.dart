class Doctor {
  final String id;
  final String name;
  final String position;
  final double rating;
  final double distance;
  final String imgUrl;

  Doctor({
    required this.id,
    required this.name,
    required this.position,
    required this.rating,
    required this.distance,
    required this.imgUrl,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      position: json['position'],
      rating: json['rating'].toDouble(),
      distance: json['distance'].toDouble(),
      imgUrl: json['imgUrl'],
    );
  }

  get doctImage => null;
}
