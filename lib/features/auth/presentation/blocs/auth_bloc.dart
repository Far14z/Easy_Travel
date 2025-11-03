import 'package:easy_travel/features/auth/data/auht_service.dart';
import 'package:easy_travel/features/auth/domain/user.dart';
import 'package:easy_travel/features/auth/presentation/blocs/auth_event.dart';
import 'package:easy_travel/features/auth/presentation/blocs/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final User user = await AuhtService().login(
          event.email,
          event.password,
        );
        emit(AuthSuccessState(user: user));
      } catch (e) {
        emit(AuthFailureState(message: e.toString()));
      }
    });
  }
}