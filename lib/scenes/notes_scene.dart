import 'package:EverPobre/domain/note.dart';
import 'package:EverPobre/domain/notebook.dart';
import 'package:EverPobre/scenes/detail_scene.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final Notebook model = Notebook.testDataBuilder();

class NotesListView extends StatefulWidget {
  static final routeName = "/notesList";

  final Notebook _model = model;

  @override
  _NotesListViewState createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  void modelDidChange() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    widget._model.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget._model.removeListener(modelDidChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Everpobre"),
      ),
      body: ListView.builder(
        itemCount: widget._model.length,
        itemBuilder: (context, index) {
          return NoteSliver(widget._model, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.add(Note(content: "Una nueva nota"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoteSliver extends StatefulWidget {
  final Notebook notebook;
  final int index;
  const NoteSliver(Notebook notebook, int index)
      : this.notebook = notebook,
        this.index = index;

  @override
  _NoteSliverState createState() => _NoteSliverState();
}

class _NoteSliverState extends State<NoteSliver> {
  @override
  Widget build(BuildContext context) {
    final DateFormat fmt = DateFormat("yyyy-mm-dd");

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebook.removeAt(widget.index);
        setState(() {});
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Element ${widget.index} has been deleted!")));
      },
      background: Container(
        color: Colors.red,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, NoteDetailView.routeName,
              arguments: widget.notebook[widget.index]);
        },
        child: Card(
          child: ListTile(
            leading: const Icon(Icons.toc),
            title: Text(widget.notebook[widget.index].body),
            subtitle:
                Text(fmt.format(widget.notebook[widget.index].updatedDate)),
          ),
        ),
      ),
    );
  }
}
