class TodosResponse {
  bool? isSuccess;
  String? errorMessage;
  List<TodoResponse>? todos;

  TodosResponse({this.isSuccess, this.errorMessage, this.todos});

  TodosResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    errorMessage = json['ErrorMessage'];
    todos = [];
    if (json['Todos'] != null) {
      for (var todo in json['Todos']) {
        todos!.add(TodoResponse.fromJson(todo));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['ErrorMessage'] = this.errorMessage;
    if (this.todos != null) {
      data['Todos'] = this.todos?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TodoResponse {
  int? id;
  String? name;
  String? description;
  String? deadline;
  bool? isCompleted;

  TodoResponse({this.id, this.name, this.description, this.deadline, this.isCompleted});

  TodoResponse.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    description = json['Description'];
    deadline = json['Deadline'];
    isCompleted = json['IsCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Deadline'] = this.deadline;
    data['IsCompleted'] = this.isCompleted;
    return data;
  }
}