import 'package:flutter/material.dart';
import 'package:EverPobre/extensions/date_time.dart';

class Note {
  // Fields
  String _body = "";
  DateTime _creationDate;
  DateTime _updatedDate;

  // Constructors
  Note({String content}) : _body = content {
    _updatedDate = DateTime.now();
    _creationDate = DateTime.now();
  }
  Note.empty() : this(content: "");

  // Getter and setters
  String get body => _body;
  set body(String content) {
    _updatedDate = DateTime.now();
    _body = content;
  }

  DateTime get creationDate => _creationDate;
  DateTime get updatedDate => _updatedDate;

  // Object protocol
  @override
  String toString() {
    return "<$runtimeType: $body>";
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    } else {
      return other is Note &&
          other.body == _body &&
          other.creationDate.almostEqual(_creationDate) &&
          other.updatedDate.almostEqual(_updatedDate);
    }
  }

  @override
  // TODO: implement hashCode
  int get hashCode {
    final proxy = DateTime(
        _creationDate.year,
        _creationDate.month,
        _creationDate.day,
        _creationDate.hour,
        _creationDate.minute,
        _creationDate.second);
    return proxy.hashCode;
  }
}
