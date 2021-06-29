class TodoModel {
  final String? id;
  final String? name;
  final String? description;
  final String? deadline;
  final String? isCompleted;

  TodoModel({this.id, this.name, this.description, this.deadline, this.isCompleted});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['Id'],
        name: json['Name'],
        description: json['Description'],
        deadline: json['Deadline'],
        isCompleted: json['IsCompleted']);
  }
}