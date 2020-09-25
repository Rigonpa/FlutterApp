import 'package:flutter_test/flutter_test.dart';
import 'package:EverPobre/domain/notebook.dart';
import 'package:EverPobre/domain/note.dart';

void main() {
  group("construction", () {
    test("Can access the shared single notebook singleton", () {
      expect(Notebook.shared, isNotNull);
    });
  });

  group("removal", () {
    test("remove by index", () {
      final Note n = Note(content: "hola");
      Notebook.shared.add(n);
      expect(() => Notebook.shared.removeAt(0), returnsNormally);

      Notebook.shared.add(n);
      expect(Notebook.shared.removeAt(0), n);
    });
  });

  group("Contents", () {
    test("length behaves correcty", () {
      final nb = Notebook();
      final nb2 = Notebook();
      final n = Note(content: "Lorem Ipsum");

      expect(nb.length, 0);
      nb2.add(n);
      expect(nb2.length, 1);
      nb2.remove(n);
      expect(nb2.length, 0);
    });
  });
}
