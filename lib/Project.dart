class Project {
  String name;
  double budget;
  //List<Task> tasks; // Ajoutez la liste de tâches

  Project({required this.name, required this.budget});

  // Ajoutez la méthode fromMap pour convertir les données de Firestore en objet Project
  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'],
      budget: map['budget'],
      //tasks: List<Task>.from(map['tasks'].map((task) => Task.fromMap(task))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'budget': budget,
     
    };
  }
}

