import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoggedOutState()) {
    on<LoginEvent>((event, emit) {
      emit(LoggedInState());
    });
    on<LogoutEvent>((event, emit) {
      emit(LoggedOutState());
    });
  }
}
