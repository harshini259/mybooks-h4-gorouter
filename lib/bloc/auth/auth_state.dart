part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  bool isLoggedIn;
  AuthState({required this.isLoggedIn});
}

final class LoggedInState extends AuthState {
  LoggedInState() : super(isLoggedIn: true);
}

final class LoggedOutState extends AuthState {
  LoggedOutState() : super(isLoggedIn: false);
}
