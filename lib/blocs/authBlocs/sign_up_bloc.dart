import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/auth_services.dart';

class EmailSignupBloc extends Bloc<EmailSignupEvent, EmailSignupState> {
  EmailSignupBloc() : super(EmailSignupInitial()) {
    on<RegisterUsingEmail>((event, emit) async {
      emit(EmailSignupProgress());
      try {
        UserCredential? authResult = await auth.signUpUsingEmail(event.signupData);
        if (authResult != null) {
          emit(EmailSignupSuccess(authResult: authResult, signupData: event.signupData));
        } else {
          emit(EmailSignupFailure("Unable to register ${event.signupData['email']}"));
        }
      } catch (e) {
        emit(EmailSignupFailure(e.toString()));
      }
    });
  }

  final AuthenticationService auth = AuthenticationService();
}

//event
abstract class EmailSignupEvent {}

//state
abstract class EmailSignupState {}

//event impl
class RegisterUsingEmail extends EmailSignupEvent {
  final Map<String, dynamic> signupData;
  RegisterUsingEmail({required this.signupData});
}

//states impl
class EmailSignupInitial extends EmailSignupState {}

class EmailSignupProgress extends EmailSignupState {}

class EmailSignupSuccess extends EmailSignupState {
  final UserCredential authResult;
  final Map<String, dynamic> signupData;
  EmailSignupSuccess({
    required this.authResult,
    required this.signupData,
  });
}

class EmailSignupFailure extends EmailSignupState {
  final String error;
  EmailSignupFailure(this.error);
}
