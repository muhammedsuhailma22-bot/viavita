class EditTaskModel {
  final String taskId;
  final String jobCategory;
  final String description;
  final String location;
  final String budget;
  final String deadlineDate;

  EditTaskModel({
    required this.taskId,
    required this.jobCategory,
    required this.description,
    required this.location,
    required this.budget,
    required this.deadlineDate,
  });

  Map<String, dynamic> toJson() => {
        "task_id": taskId,
        "job_category": jobCategory,
        "description": description,
        "location": location,
        "budget": budget,
        "deadline_date": deadlineDate,
      };
}