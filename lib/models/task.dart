class TaskModel {
  final String id;
  final String categoryName;
  final String description;
  final String location;
  final String budget;
  final String deadline;
  final String status;

  TaskModel({
    required this.id,
    required this.categoryName,
    required this.description,
    required this.location,
    required this.budget,
    required this.deadline,
    required this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"] ?? "",
      categoryName: json["category_name"] ?? "",
      description: json["description"] ?? "",
      location: json["location"] ?? "",
      budget: json["budget"] ?? "",
      deadline: json["deadline_date"] ?? "",
      status: json["status"] ?? "",
    );
  }
}
