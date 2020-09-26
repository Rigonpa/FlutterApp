import 'package:EverPobre/scenes/detail_scene.dart';
import 'package:EverPobre/scenes/notes_scene.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // Esto es un map
        NotesListView.routeName: (context) => NotesListView(),
        NoteDetailView.routeName: (context) => NoteDetailView(),
      },
      initialRoute: NotesListView.routeName,
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF388E3C),
        accentColor: Color(0xFFFFC107),
      ),
    );
  }
}
