class Driver {
  String id;
  String username;
  String email;
  String password;
  String phone;
  String typeRider;
  double latitude;
  double longitude;
  double? distanceBetween;

  Driver({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.typeRider,
    required this.latitude,
    required this.longitude,
    this.distanceBetween
  });
}