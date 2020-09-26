import 'package:EverPobre/domain/note.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteDetailView extends StatelessWidget {
  static final routeName = "/detail";
  @override
  Widget build(BuildContext context) {
    final n = ModalRoute.of(context).settings.arguments as Note;
    final DateFormat fmt = DateFormat("yyyy-mm-dd");

    return Scaffold(
      appBar: AppBar(
        title: Text("Note's detail"),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text("Note: "),
                Text(n.body),
              ],
            ),
            Row(
              children: [
                Text("Creation date: "),
                Text(fmt.format(n.creationDate)),
              ],
            ),
            Row(
              children: [
                Text("Last modification date: "),
                Text(fmt.format(n.updatedDate)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
