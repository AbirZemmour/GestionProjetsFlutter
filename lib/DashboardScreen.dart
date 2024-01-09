import 'package:flutter/material.dart';
import 'package:gestion_projet2/project_creation_screen.dart';
import 'package:gestion_projet2/Project.dart'; // Assure-toi d'importer correctement la classe Project

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Project> projects = []; // Liste de projets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord'),
      ),
      body: projects.isEmpty
          ? Center(
              child: Text('Aucun projet créé.'),
            )
          : ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(projects[index].name),
                  subtitle: Text('Budget: ${projects[index].budget}'),
                  // Ajoute d'autres informations que tu souhaites afficher
                  // Lorsque l'utilisateur appuie sur un projet, tu peux naviguer vers les détails du projet
                  onTap: () {
                    // Ajoute ici la navigation vers les détails du projet
                    print('Projet sélectionné: ${projects[index].name}');
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Naviguer vers l'écran d'ajout de projet et mettre à jour la liste de projets après retour
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectCreationScreen(),
            ),
          ).then((result) {
            if (result != null && result is Project) {
              setState(() {
                projects.add(result);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
