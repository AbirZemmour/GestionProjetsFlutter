class Project {
  String name;
  DateTime startDate;
  DateTime endDate;
  double budget;
  
  //List<Task> tasks;

  Project({required this.name, required this.startDate, required this.endDate, required this.budget});

  //String get projectName => null;

  get projectDescription => null;

  Object? get id => null;
   Map<String, dynamic> toMap() {
    return {
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
      'budget': budget,
    };
  }
}

/*class Task {
  String name;
  String description;
  DateTime dueDate;

  Task({required this.name, required this.description, required this.dueDate});
}
*/