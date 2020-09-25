import 'package:EverPobre/domain/note.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Construction", () {
    // Los test de construction
    test("No empty note", () {
      final Note n1 = Note(content: "No empty note");
      expect(n1.body, isNotEmpty);
      n1.body = "";
      expect(n1.body, isEmpty);
      expect(Note.empty().body, "");
    });
  });
  group("dates", () {
    test("ModificationDate after creationDate", () {
      final n1 = Note.empty();
      n1.body = "Random note";
      expect(n1.creationDate.isBefore(n1.updatedDate), isTrue);
    });
  });
  group("Object protocol", () {
    test("Equality", () {
      final Note n1 = Note(content: "Note 1");
      final Note n2 = Note(content: "Note 2");
      expect(n1, n1);
      expect(n1, Note(content: "Note 1"));
      expect(n1 != n2, isTrue);
    });
  });

  test("hashCode", () {
    // Dos objetos que son iguales deben tener = hash code,
    // Pero dos objetos que tengan = hash code no tienen porqué ser iguales.
    final Note n1 = Note(content: "Note x");
    final Note n2 = Note(content: "Note x");

    expect(n1.hashCode, n2.hashCode);
  });
}
