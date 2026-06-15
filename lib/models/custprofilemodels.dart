class Custprofilemodels {
  int id;
  String name;
  String gender;
  String phone;
  String email;
  String address;

  String avatar;
  Custprofilemodels({
    required this.id,
    required this.gender,
    required this.phone,
    required this.address,
    required this.avatar,
    required this.name,
    required this.email,
  });
  factory Custprofilemodels.fromJson(Map<String, dynamic> json) {
    return Custprofilemodels(
      id: int.parse(json["id"].toString()),

      name: json["name"] ?? "",

      gender: json["gender"] ?? "",

      phone: json["phone_number"] ?? "",

      email: json["email_id"] ?? "",

      address: json["address"] ?? "",

      avatar: json["avatar"] ?? "",
    );
  }
}
