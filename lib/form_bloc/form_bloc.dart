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

  Future<void> _formInit(FormInitEvent event, Emitter<FormPageState> emit) async {}


  Future<void> _firstnameChanged(FirstNameEvent event, Emitter<FormPageState> emit) async {
    emit(state.copyWith(firstName: event.value));
  }

  Future<void> _lastnameChanged(LastNameEvent event, Emitter<FormPageState> emit) async {
    emit(state.copyWith(lastName: event.value));
  }

  Future<void> _passwordChanged(PasswordValidationEvent event, Emitter<FormPageState> emit) async {
    emit(state.copyWith(password: event.value));
  }

  Future<void> _confirmPasswordChanged(ConfirmPasswordValidationEvent event, Emitter<FormPageState> emit) async {
    emit(state.copyWith(confirmPassword: event.value));
  }

  Future<void> _emailChanged(EmailValidationEvent event, Emitter<FormPageState> emit) async {
    emit(state.copyWith(email: event.value));
  }

  Future<void> _passwordTap(OnPasswordTap event, Emitter<FormPageState> emit) async {
    emit(state.copyWith(isPasswordVisible: event.showPassword));
  }
  Future<void> _confirmPasswordTap(ConfirmPasswordTapEvent event, Emitter<FormPageState> emit) async {
    emit(state.copyWith(isConfirmPasswordVisible: event.showConfirmPassword));
  }

  Future<void> _formSubmit(FormPageSubmitEvent event, Emitter<FormPageState> emit) async {

  }

  Future<void> _unFocus(UnfocusEvent event, Emitter<FormPageState> emit) async {

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
