import 'package:flutter/material.dart';
import 'package:gestion_projet2/Task.dart';
import 'package:gestion_projet2/Project.dart';
import 'package:gestion_projet2/loginscreen.dart'; // Assurez-vous d'importer le fichier correct

class Dashboard extends StatelessWidget {
  final List<Project> projects;
  final List<Task> tasks;

  Dashboard({required this.projects, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bienvenue dans le tableau de bord!'),
          SizedBox(height: 40.0),
          Text('Liste des projets :', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                Project project = projects[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(project.name),
                      subtitle: Text('Description : ${project.name}'),
                    ),
                    Text('Tâches associées :', style: TextStyle(fontWeight: FontWeight.bold)),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      itemBuilder: (context, taskIndex) {
                        Task task = tasks[taskIndex];
                        if (task.projectId == project.id) {
                          // Affiche la tâche uniquement si elle est associée à ce projet
                          return ListTile(
                            title: Text(task.name),
                            subtitle: Text('Date limite : ${task.dueDate}'),
                          );
                        } else {
                          return SizedBox.shrink(); // Cache la tâche si elle n'est pas associée à ce projet
                        }
                      },
                    ),
                    Divider(), // Ajoute une ligne de séparation entre les projets
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text('Se connecter'),
          ),
        ],
      ),
    );
  }
}
