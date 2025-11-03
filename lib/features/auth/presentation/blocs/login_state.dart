import 'package:easy_travel/core/enums/status.dart';

class LoginState {

  final Status status;
  final String email;
  final String password;
  final bool isPasswordVisibile;
  final String? message;

  const LoginState({
      this.status = Status.initial,
      this.email = '',
      this.password = '',
      this.isPasswordVisibile = false,
      this.message
    }
  );

  LoginState copyWith({
    Status? status,
    String? email,
    String? password,
    bool? isPasswordVisibile,
    String? message
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisibile: isPasswordVisibile ?? this.isPasswordVisibile,
      message: message ?? this.message
    );
  }
}