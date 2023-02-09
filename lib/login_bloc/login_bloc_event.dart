import 'package:equatable/equatable.dart';

abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();
}

class DoLoginEvent extends LoginBlocEvent {
  // ignore: non_constant_identifier_names
  final String Email;
  // ignore: non_constant_identifier_names
  final String Password;

  const DoLoginEvent(this.Email, this.Password);

  @override
  List<Object> get props => [Email, Password];
}
