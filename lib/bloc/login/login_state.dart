

import 'package:flutter/foundation.dart';
import 'package:loginbloc/models.dart';

@immutable
class AppState {
  final bool isLoading;
  final LoginHandler? loginHandler;
  final LoginErrors? loginErrors;
  final Iterable<Note>? fetchNote;

  const AppState({
    required this.isLoading,
    required this.loginHandler,
    required this.loginErrors,
    required this.fetchNote,
  });

  const AppState.empty()
      : isLoading = false,
        loginHandler = null,
        loginErrors = null,
        fetchNote = null;

  @override
  String toString() {
    return {
      'isLoading': isLoading,
      'loginError': loginErrors,
      'loginHandler': loginHandler,
      'Notes': fetchNote,
    }.toString();
  }
}
