import '../project_setup.dart';

class FormPageState {
  BuildContext? context;
  String? username;
  String? firstName;
  String? lastName;
  String? password;
  String? confirmPassword;
  String? email;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  bool? isPassword ;
  bool? isConfirmPassword ;
  String? profileImagePath;

  FormPageState({
    this.context,
    this.username,
    this.firstName,
    this.lastName,
    this.password,
    this.confirmPassword,
    this.email,
    FocusNode? emailFocusNode,
    FocusNode? passwordFocusNode,
    FocusNode? confirmPasswordFocusNode,
    FocusNode? firstNameFocusNode,
    FocusNode? lastNameFocusNode,
    this.isPassword = true ,
    this.isConfirmPassword = true ,
    this.profileImagePath
  }): emailFocusNode = emailFocusNode ?? FocusNode(),
        passwordFocusNode = passwordFocusNode ?? FocusNode(),
        confirmPasswordFocusNode = confirmPasswordFocusNode ?? FocusNode(),
        firstNameFocusNode = firstNameFocusNode ?? FocusNode(),
        lastNameFocusNode = lastNameFocusNode ?? FocusNode();

  FormPageState copyWith({
    BuildContext? context,
    bool? loader,
    String? username,
    String? firstName,
    String? lastName,
    String? password,
    String? confirmPassword,
    String? email,
    FocusNode? emailFocusNode,
    FocusNode? passwordFocusNode,
    FocusNode? confirmPasswordFocusNode,
    FocusNode? firstNameFocusNode,
    FocusNode? lastNameFocusNode,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    String? profileImagePath,
  }) {
    return FormPageState(
      context: context ?? this.context,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      email: email ?? this.email,
      emailFocusNode: emailFocusNode ?? this.emailFocusNode,
      passwordFocusNode: passwordFocusNode ?? this.passwordFocusNode,
      confirmPasswordFocusNode: confirmPasswordFocusNode ?? this.confirmPasswordFocusNode,
      firstNameFocusNode: firstNameFocusNode ?? this.firstNameFocusNode,
      lastNameFocusNode: lastNameFocusNode ?? this.lastNameFocusNode,
      isPassword: isPasswordVisible ?? isPassword,
      isConfirmPassword: isConfirmPasswordVisible ?? isConfirmPassword,
      profileImagePath: profileImagePath ?? this.profileImagePath,
    );
  }
}
