import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../project_setup.dart';


class FormPageBloc extends Bloc<FormEvent, FormPageState> {
  final formKey = GlobalKey<FormState>();

  FormPageBloc() : super(FormPageState()) {
    on<FormInitEvent>(_formInit);
    on<FirstNameEvent>(_firstnameChanged);
    on<LastNameEvent>(_lastnameChanged);
    on<PasswordValidationEvent>(_passwordChanged);
    on<ConfirmPasswordValidationEvent>(_confirmPasswordChanged);
    on<EmailValidationEvent>(_emailChanged);
    on<OnPasswordTap>(_passwordTap);
    on<ConfirmPasswordTapEvent>(_confirmPasswordTap);
    on<FormPageSubmitEvent>(_formSubmit);
    on<UnfocusEvent>(_unFocus);

  }

  void _formInit(FormInitEvent event, Emitter<FormPageState> emit) async {}


  void _firstnameChanged(FirstNameEvent event, Emitter<FormPageState> emit) {
    emit(state.copyWith(firstName: event.value));
  }

  void _lastnameChanged(LastNameEvent event, Emitter<FormPageState> emit) {
    emit(state.copyWith(lastName: event.value));
  }

  void _passwordChanged(PasswordValidationEvent event, Emitter<FormPageState> emit) {
    emit(state.copyWith(password: event.value));
  }

  void _confirmPasswordChanged(ConfirmPasswordValidationEvent event, Emitter<FormPageState> emit) {
    emit(state.copyWith(confirmPassword: event.value));
  }

  void _emailChanged(EmailValidationEvent event, Emitter<FormPageState> emit) {
    emit(state.copyWith(email: event.value));
  }

  void _passwordTap(OnPasswordTap event, Emitter<FormPageState> emit) {
    emit(state.copyWith(isPasswordVisible: event.showPassword));
  }
  void _confirmPasswordTap(ConfirmPasswordTapEvent event, Emitter<FormPageState> emit) {
    emit(state.copyWith(isConfirmPasswordVisible: event.showConfirmPassword));
  }

  void _formSubmit(FormPageSubmitEvent event, Emitter<FormPageState> emit) {

  }

  void _unFocus(UnfocusEvent event, Emitter<FormPageState> emit) {

    state.emailFocusNode.unfocus();
    state.passwordFocusNode.unfocus();
    state.confirmPasswordFocusNode.unfocus();
    state.firstNameFocusNode.unfocus();
    state.lastNameFocusNode.unfocus();
  }

  @override
  Future<void> close() {
    state.emailFocusNode.dispose();
    state.passwordFocusNode.dispose();
    state.confirmPasswordFocusNode.dispose();
    state.firstNameFocusNode.dispose();
    state.lastNameFocusNode.dispose();
    return super.close();
  }

}
