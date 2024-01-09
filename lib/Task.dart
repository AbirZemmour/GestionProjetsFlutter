// task_planning_screen.dart
import 'package:flutter/material.dart';
import 'package:gestion_projet2/Project.dart';

class TaskPlanningScreen extends StatefulWidget {
  final String projectName;
  final List<Project> projects;

  TaskPlanningScreen({required this.projectName, required this.projects});

  @override
  _TaskPlanningScreenState createState() => _TaskPlanningScreenState();
}

class _TaskPlanningScreenState extends State<TaskPlanningScreen> {
  late TextEditingController taskNameController;
  late TextEditingController taskDueDateController;

  List<Task> tasks = []; // Initialisez la liste de tâches

  @override
  void initState() {
    super.initState();
    taskNameController = TextEditingController();
    taskDueDateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planification des tâches pour ${widget.projectName}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ajouter les champs de texte pour le nom de la tâche, la date limite, etc.
          TextField(
            controller: taskNameController,
            decoration: InputDecoration(labelText: 'Nom de la tâche'),
          ),
          TextField(
            controller: taskDueDateController,
            decoration: InputDecoration(labelText: 'Date limite (YYYY-MM-DD)'),
          ),
          // Ajouter le bouton pour ajouter la tâche
          ElevatedButton(
            onPressed: () {
              // Ajouter la tâche à la liste de tâches
              setState(() {
                tasks.add(Task(
                  name: taskNameController.text,
                  description: '', // Ajoutez la description si nécessaire
                  dueDate: DateTime.parse(taskDueDateController.text),
                  projectid: 0, // Ajoutez la valeur correcte du projectid
                ));

                // Effacer les champs après l'ajout de la tâche
                taskNameController.clear();
                taskDueDateController.clear();
              });
            },
            child: Text('Ajouter la tâche'),
          ),
          // Ajouter la liste des tâches ici si vous le souhaitez
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                Task task = tasks[index];
                return ListTile(
                  title: Text(task.name),
                  subtitle: Text('Date limite : ${task.dueDate}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Task {
  String name;
  String description;
  DateTime dueDate;
  int projectid;

  Task({
    required this.name,
    required this.description,
    required this.dueDate,
    required this.projectid,
  });

  get project => null;

  get projectId => null;
}
