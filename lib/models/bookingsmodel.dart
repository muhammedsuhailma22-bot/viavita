class EstimateModel {
  int estimateId;

  String amount;
  String description;
  String status;

  String shopName;
  String phone;
  String email;
  String address;

  EstimateModel({
    required this.estimateId,

    required this.amount,
    required this.description,
    required this.status,

    required this.shopName,
    required this.phone,
    required this.email,
    required this.address,
  });

  factory EstimateModel.fromJson(Map<String, dynamic> json) {
    return EstimateModel(
      estimateId: int.parse(json["estimate_id"].toString()),

      amount: json["estimate_amount"] ?? "",

      description: json["estimate_description"] ?? "",

      status: json["estimate_status"] ?? "",

      shopName: json["shop_name"] ?? "",

      phone: json["shop_phone"] ?? "",

      email: json["shop_email"] ?? "",

      address: json["address"] ?? "",
    );
  }
}
