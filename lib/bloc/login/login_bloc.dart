//import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginbloc/apis/login_api.dart';
import 'package:loginbloc/apis/note_api.dart';
import 'package:loginbloc/models.dart';

import 'login_actions.dart';
import 'login_state.dart';

class AppBloc extends Bloc<AppAction, AppState> {
  final LoginApiProtocal loginApiProtocal;
  final NoteApiProtocol noteApiProtocol;

  AppBloc({
    required this.loginApiProtocal,
    required this.noteApiProtocol,
  }) : super(const AppState.empty()) {
    on<LoginAction>(
      (event, emit) async {
        emit(
          const AppState(
            isLoading: true,
            loginHandler: null,
            loginErrors: null,
            fetchNote: null,
          ),
        );

        final loginHandler = await loginApiProtocal.login(
          username: event.email,
          password: event.password,
        );
        final loginErrors =
            loginHandler == null ? LoginErrors.invalidHandler : null;
        emit(
          AppState(
            isLoading: false,
            loginHandler: loginHandler,
            loginErrors: loginErrors,
            fetchNote: null,
          ),
        );
      },
    );
    on<LoadnoteAction>(
      (event, emit) async {
        emit(
          AppState(
            isLoading: true,
            loginHandler: state.loginHandler,
            loginErrors: null,
            fetchNote: null,
          ),
        );

        final loginHandler = state.loginHandler;

        if (loginHandler != const LoginHandler.foobar()) {
          emit(
            AppState(
              isLoading: false,
              loginHandler: state.loginHandler,
              loginErrors: LoginErrors.invalidHandler,
              fetchNote: null,
            ),
          );
          return;
        } else {
          final fetchNote =
              await noteApiProtocol.getNotes(loginHandler: state.loginHandler!);
          emit(
            AppState(
              isLoading: false,
              loginHandler: state.loginHandler,
              loginErrors: null,
              fetchNote: fetchNote,
            ),
          );
        }
      },
    );
  }
}
