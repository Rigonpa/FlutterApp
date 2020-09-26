import 'package:flutter_test/flutter_test.dart';
import 'package:EverPobre/domain/notebooks.dart';
import 'package:EverPobre/domain/notebook.dart';

void main() {
  group("construction", () {
    test("Can access the shared single notebook singleton", () {
      expect(Notebooks.shared, isNotNull);
    });
  });

  group("removal", () {
    test("remove by index", () {
      final Notebook n = Notebook.testDataBuilder();
      Notebooks.shared.add(n);
      expect(() => Notebooks.shared.removeAt(0), returnsNormally);

      Notebooks.shared.add(n);
      expect(Notebooks.shared.removeAt(0), n);
    });

    test("remove by index 2", () {
      final Notebooks ns = Notebooks.loadData();
      expect(ns.length, 15);
      ns.removeAt(2);
      expect(ns.length, 14);
    });
  });

  group("Contents", () {
    test("length behaves correcty", () {
      final nb = Notebooks();
      final nb2 = Notebooks();
      final n = Notebook();

      expect(nb.length, 0);
      nb2.add(n);
      expect(nb2.length, 1);
      nb2.remove(n);
      expect(nb2.length, 0);
    });
  });
}
