class AddTaskModel {
  final String customerId;
  final String jobCategory;
  final String description;
  final String location;
  final String budget;
  final String deadlineDate;

  AddTaskModel({
    required this.customerId,
    required this.jobCategory,
    required this.description,
    required this.location,
    required this.budget,
    required this.deadlineDate,
  });

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "job_category": jobCategory,
        "description": description,
        "location": location,
        "budget": budget,
        "deadline_date": deadlineDate,
      };
}