import 'package:EverPobre/domain/notebooks.dart';
import 'package:flutter/material.dart';

final Notebooks model = Notebooks.loadData();

class NotebooksListView extends StatefulWidget {
  static const routeName = "/notebooksList";

  final Notebooks m = model;

  @override
  _NotebooksListViewState createState() => _NotebooksListViewState();
}

class _NotebooksListViewState extends State<NotebooksListView> {
  void stateChanged() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    widget.m.addListener(stateChanged);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.m.removeListener(stateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notebooks"),
        ),
        body: ListView.builder(
          itemCount: widget.m.length,
          itemBuilder: (context, index) {
            return NotebookSliver(widget.m, index);
          },
        ));
  }
}

class NotebookSliver extends StatefulWidget {
  final Notebooks notebooks;
  final int index;

  const NotebookSliver(Notebooks notebooks, int index)
      : notebooks = notebooks,
        index = index;

  @override
  _NotebookSliverState createState() => _NotebookSliverState();
}

class _NotebookSliverState extends State<NotebookSliver> {
  @override
  Widget build(BuildContext context) {
    final noteb = widget.notebooks[widget.index];
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        widget.notebooks.removeAt(widget.index);
        setState(() {});
      },
      child: Card(
        child: ListTile(
          leading: Icon(Icons.book),
          title: Text("Notebook ${noteb[widget.index].body}"),
        ),
      ),
    );
  }
}
