import 'package:flutter/material.dart';
import 'package:gestion_projet2/project_creation_screen.dart';
import 'package:gestion_projet2/Project.dart'; // Assure-toi d'importer correctement la classe Project
import 'package:cloud_firestore/cloud_firestore.dart'; // Ajoute cette importation

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
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('projects').get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erreur: ${snapshot.error}'),
            );
          } else {
            // Mettre à jour la liste de projets avec les données de Firestore
            projects = snapshot.data!.docs
                .map((doc) => Project.fromMap(doc.data() as Map<String, dynamic>))
                .toList();

            return projects.isEmpty
                ? Center(
                    child: Text('Aucun projet créé.'),
                  )
                :// ...

GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 1.0,
    mainAxisSpacing: 1.0,
  ),
  itemCount: projects.length,
  itemBuilder: (context, index) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        title: Text(projects[index].name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Budget: ${projects[index].budget}'),
            Text('Tâches:'),
            // Afficher les tâches du projet
          ],
        ),
        onTap: () {
          // Naviguer vers les détails du projet (écran de détails du projet)
          // Vous pouvez passer le projet actuel à l'écran de détails pour afficher toutes les informations
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailsScreen(project: projects[index]),
            ),
          );
        },
      ),
    );
  },
);

// ...

          }
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

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  ProjectDetailsScreen({required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Budget: ${project.budget}'),
          Text('Tâches:'),
          // Afficher les tâches du projet
          // Ajoutez d'autres informations du projet que vous souhaitez afficher
        ],
      ),
    );
  }
}
