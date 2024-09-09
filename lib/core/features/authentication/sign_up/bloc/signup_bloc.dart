import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../services/auth_service.dart';
import '../../../../services/validation_service.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignUpState> {
  SignUpBloc() : super(SignupInitial());

  final fullNameController = TextEditingController();
  final contactController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isButtonEnabled = false;

  Stream<SignUpState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is OnTextChangedEvent) {
      if (isButtonEnabled != checkIfSignUpButtonEnabled()) {
        isButtonEnabled = checkIfSignUpButtonEnabled();
        yield SignUpButtonEnableChangedState(isEnabled: isButtonEnabled);
      }
    } else if (event is SignUpTappedEvent) {
      if (checkValidatorsOfTextField()) {
        try {
          yield LoadingState();
          await AuthService.signUp(passwordController.text, fullNameController.text, contactController.text);
          yield NextTabBarPageState();
          print("Go to the next page");
        } catch (e) {
          yield ErrorState(message: e.toString());
        }
      } else {
        yield ShowErrorState();
      }
    } else if (event is SignInTappedEvent) {
      yield NextSignInPageState();
    }
  }

  bool checkIfSignUpButtonEnabled() {
    return fullNameController.text.isNotEmpty &&
        contactController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  bool checkValidatorsOfTextField() {
    return ValidationService.username(fullNameController.text) &&
        ValidationService.email(contactController.text) &&
        ValidationService.password(passwordController.text) &&
        ValidationService.confirmPassword(passwordController.text, confirmPasswordController.text);
  }
}
