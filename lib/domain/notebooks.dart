import 'package:EverPobre/domain/notebook.dart';
import 'package:flutter/material.dart';

class Notebooks with ChangeNotifier {
  static final shared = Notebooks();

  final List<Notebook> _notebooks = [];

  int get length => _notebooks.length;

  // Constructors
  Notebooks();
  Notebooks.loadData() {
    _notebooks.addAll(List.generate(15, (index) {
      return Notebook.testDataBuilder();
    }));
  }

  // Accesores
  Notebook operator [](int index) {
    return _notebooks[index];
  }

  // Modifiers
  void add(Notebook notebook) {
    _notebooks.insert(0, notebook);
    notifyListeners();
  }

  void remove(Notebook notebook) {
    _notebooks.remove(notebook);
    notifyListeners();
  }

  Notebook removeAt(int index) {
    final Notebook n = _notebooks.removeAt(index);
    notifyListeners();
    return n;
  }

  // Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $length notebooks>";
  }
}
