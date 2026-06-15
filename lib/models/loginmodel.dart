class Loginmodel {
  final String email;
  final String password;

  Loginmodel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "device_token": "123456",
  };
}
