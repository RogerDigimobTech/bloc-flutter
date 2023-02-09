import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'bloc.dart';
// ignore: unnecessary_import
import 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc(super.initialState);

  LoginBlocState get initialState => InitialLoginBlocState();

  @override
  Stream<LoginBlocState> mapEventToState(
    LoginBlocEvent event,
  ) async* {
    if (event is DoLoginEvent) {
      yield LogginInBlocState();

      await Future.delayed(const Duration(seconds: 3));
      yield const ErrorBlocState('Error, falta algun dato por ingresar');
    }
  }
}
