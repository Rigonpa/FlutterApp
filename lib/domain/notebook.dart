import 'package:EverPobre/domain/note.dart';

class Notebook {
  static final shared = Notebook();

  final List<Note> _notes = [];

  int get length => _notes.length;

  // Constructores
  Notebook();
  Notebook.testDataBuilder() {
    _notes.addAll(List.generate(100, (index) => Note(content: "Item $index")));
  }

  // Accesores
  Note operator [](int index) {
    return _notes[index];
  }

  // Mutadores
  bool remove(Note note) {
    return _notes.remove(note);
  }

  Note removeAt(int index) {
    return _notes.removeAt(index);
  }

  void add(Note note) {
    _notes.insert(0, note);
  }

  // Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $length notes>";
  }
}
