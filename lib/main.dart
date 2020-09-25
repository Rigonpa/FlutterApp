import 'package:EverPobre/domain/notebook.dart';
import 'package:EverPobre/scenes/notes_scene.dart';
import 'package:flutter/material.dart';

final Notebook model = Notebook.testDataBuilder();
void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Everpobre",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Everpobre"),
          ),
          body: NotesListView(model),
        ));
  }
}
