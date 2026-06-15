class SignupModel {
  final String name;
  final String gender;
  final String phoneNumber;
  final String email;
  final String address;
  final String password;

  SignupModel({
    required this.name,
    required this.gender,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "gender": gender,
    "phone_number": phoneNumber,
    "email": email,
    "address": address,
    "password": password,
  };
}