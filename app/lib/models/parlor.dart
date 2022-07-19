class Parlor {
  final int? id;
  final String? name;
  final String? description;
  final String? imgUrl;

  const Parlor({this.id, this.name, this.description, this.imgUrl});
}

class ParlorLocation {
  final double latitude;
  final double longitude;
  final String address;

  const ParlorLocation({
    required this.latitude,
    required this.longitude,
    this.address = '',
  });
}
