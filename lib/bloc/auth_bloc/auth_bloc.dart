import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/bloc/auth_bloc/auth_event.dart';
import 'package:pixelfield/bloc/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      // Email validation using regex
      final RegExp emailRegex =
          RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
      if (event.email.isEmpty && event.password.isEmpty) {
        emit(AuthFailure(error: "Please enter your email and password"));
        return;
      }
      if (event.email.isEmpty) {
        emit(AuthFailure(error: "Please enter your email"));
        return;
      }
      if (!emailRegex.hasMatch(event.email)) {
        emit(AuthFailure(error: "Invalid email format"));
        return;
      }
      if (event.password.isEmpty) {
        emit(AuthFailure(error: "Please enter your password"));
        return;
      }

      await Future.delayed(Duration(seconds: 2)); // Simulating API call
      if (event.email == "email@email.com" && event.password == "password123") {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(error: "Invalid email or password"));
      }
    });
  }
}
