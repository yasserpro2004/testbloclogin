import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginbloc/apis/login_api.dart';
import 'package:loginbloc/apis/note_api.dart';
import 'package:loginbloc/dialogs/generic_dialog.dart';
import 'package:loginbloc/dialogs/loading_screen.dart';
import 'package:loginbloc/models.dart';
import 'package:loginbloc/strings.dart';
import 'package:loginbloc/views/list_view.dart';
import 'package:loginbloc/views/login_view.dart';
import 'bloc/login/login_actions.dart';
import 'bloc/login/login_bloc.dart';
import 'bloc/login/login_state.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        loginApiProtocal: LoginApi(),
        noteApiProtocol: NoteApi(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(homePage),
        ),
        body: BlocConsumer<AppBloc, AppState>(
          listener: (context, state) {
            // loading dialog
            //final loadingScreen = LoadingScreen.instance();
            if (state.isLoading) {
              LoadingScreen.instance().show(
                context: context,
                text: pleaseWait,
              );
            } else {
              LoadingScreen.instance().hide();
            }
            //
            final loginError = state.loginErrors;
            if (loginError != null) {
              showGenericDialog<bool>(
                context: context,
                title: loginErrorDialogTitle,
                content: loginErrorDilogContent,
                optionBuilder: () => {ok: true},
              );
            }
            if (state.isLoading == false &&
                state.loginErrors == null &&
                state.loginHandler == const LoginHandler.foobar() &&
                state.fetchNote == null) {
              context.read<AppBloc>().add(
                    const LoadnoteAction(),
                  );
            }
          },
          builder: (context, state) {
            final note = state.fetchNote;
            if (note == null) {
              return MyLoginView(
                loginTapped: (email, password) {
                  context.read<AppBloc>().add(
                        LoginAction(
                          email: email,
                          password: password,
                        ),
                      );
                },
              );
            } else {
              return note.toListView();
            }
          },
        ),
      ),
    );
  }
}
