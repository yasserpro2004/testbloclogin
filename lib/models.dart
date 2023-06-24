import 'package:flutter/foundation.dart' show immutable;

@immutable
class LoginHandler {
  final String token;

  const LoginHandler({
    required this.token,
  });

  const LoginHandler.foobar() : token = 'foobar';

  @override
  bool operator ==(covariant LoginHandler other) => token == other.token;

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() {
    return 'LogenHandler => token = $token ';
  }
}

enum LoginErrors { invalidHandler }

@immutable
class Note {
  final String title;

  const Note({
    required this.title,
  });

  @override
  String toString() {
    return 'title = $title';
  }
}

final mocNotes = Iterable.generate(3, (index) {
  final num = index + 1;
  return Note(
    title: 'Note $num',
  );
});

