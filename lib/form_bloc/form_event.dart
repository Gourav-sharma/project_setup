import 'package:flutter/material.dart';

abstract class FormEvent {}

class FormInitEvent extends FormEvent {

  final BuildContext context;
  FormInitEvent({
    required this.context});

}

class FirstNameEvent extends FormEvent {
  final String value;

  FirstNameEvent(this.value);
}

class LastNameEvent extends FormEvent {
  final String value;

  LastNameEvent(this.value);
}

class PasswordValidationEvent extends FormEvent {
  final String value;

  PasswordValidationEvent(this.value);
}

class ConfirmPasswordValidationEvent extends FormEvent {
  final String value;

  ConfirmPasswordValidationEvent(this.value);
}

class EmailValidationEvent extends FormEvent {
  final String value;

  EmailValidationEvent(this.value);
}

class OnPasswordTap extends FormEvent {
  final bool showPassword;
  OnPasswordTap({this.showPassword = true});
}

class ConfirmPasswordTapEvent extends FormEvent {
  final bool showConfirmPassword;
  ConfirmPasswordTapEvent({this.showConfirmPassword = true});
}

class FormPageSubmitEvent extends FormEvent {}

class UnfocusEvent extends FormEvent {}

