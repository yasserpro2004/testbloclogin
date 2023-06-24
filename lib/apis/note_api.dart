import 'package:flutter/foundation.dart' show immutable;
import 'package:loginbloc/models.dart';

@immutable
abstract class NoteApiProtocol {
  const NoteApiProtocol();

  Future<Iterable<Note>?> getNotes({required LoginHandler loginHandler});
}

@immutable
class NoteApi implements NoteApiProtocol {
  //singlton instanace
/*   const NoteApi._sharedInstance();
  static const NoteApi _shared = NoteApi._sharedInstance();
  factory NoteApi.instance() => _shared; */

  @override
  Future<Iterable<Note>?> getNotes({
    required LoginHandler loginHandler,
  }) =>
      Future.delayed(
        const Duration(seconds: 3),
        () => loginHandler == const LoginHandler.foobar() ? mocNotes : null,
      );
}
