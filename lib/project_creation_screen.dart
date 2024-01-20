import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_projet2/DashboardScreen.dart';
import 'package:gestion_projet2/Project.dart';  // Assurez-vous que le chemin est correct

class ProjectCreationScreen extends StatefulWidget {
  @override
  _ProjectCreationScreenState createState() => _ProjectCreationScreenState();
}

class _ProjectCreationScreenState extends State<ProjectCreationScreen> {
  late TextEditingController projectNameController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;
  late TextEditingController budgetController;

  List<Project> projects = [];

  @override
  void initState() {
    super.initState();
    projectNameController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    budgetController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Création de projet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: projectNameController,
              decoration: InputDecoration(labelText: 'Nom du projet'),
            ),
            TextField(
              controller: startDateController,
              decoration: InputDecoration(labelText: 'Date de début'),
            ),
            TextField(
              controller: endDateController,
              decoration: InputDecoration(labelText: 'Date de fin'),
            ),
            TextField(
              controller: budgetController,
              decoration: InputDecoration(labelText: 'Budget'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                Project newProject = Project(
                  name: projectNameController.text,
                 // startDate: DateTime.parse(startDateController.text),
                  //endDate: DateTime.parse(endDateController.text),
                  budget: double.parse(budgetController.text)
                );

                await FirebaseFirestore.instance.collection('projects').add(newProject.toMap());

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Projet créé avec succès!'),
                  ),
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),  // Assurez-vous que le nom de la classe est correct
                  ),
                );
              },
              child: Text('Créer le projet'),
            ),
          ],
        ),
      ),
    );
  }
}
