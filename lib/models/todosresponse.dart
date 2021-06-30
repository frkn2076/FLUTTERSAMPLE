class TodosResponse {
  bool? isSuccess;
  String? errorMessage;
  List<Todo>? todos;

  TodosResponse({this.isSuccess, this.errorMessage, this.todos});

  TodosResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    errorMessage = json['errorMessage'];
    if (json['todos'] != null) {
      todos = List.empty();
      json['todos'].forEach((v) {
        todos!.add(new Todo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['errorMessage'] = this.errorMessage;
    if (this.todos != null) {
      data['todos'] = this.todos?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Todo {
  int? id;
  String? name;
  String? description;
  String? deadline;
  bool? isCompleted;

  Todo(
      {this.id, this.name, this.description, this.deadline, this.isCompleted});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    deadline = json['deadline'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['deadline'] = this.deadline;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}