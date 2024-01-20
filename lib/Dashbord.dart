import 'package:flutter/material.dart';
import 'package:gestion_projet2/Task.dart';
import 'package:gestion_projet2/Project.dart';
import 'package:gestion_projet2/LoginScreen.dart'; // Assurez-vous d'importer le fichier correct

class Dashboard extends StatelessWidget {
  final List<Project> projects;
  //final List<Task> tasks;

  Dashboard({required this.projects});

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
