import '../../../../data/model/user_model.dart';

abstract class LoginStates {}

class PhoneInitalStates extends LoginStates {}

class PhoneLoadingStates extends LoginStates {}

class PhoneSuccesStates extends LoginStates {}

class PhoneErrorStates extends LoginStates {
  final String error;

  PhoneErrorStates(this.error);
}

class ChangePasswordVisabilityStates extends LoginStates {}

class PhoneNumberSubmited extends LoginStates {}

class PhoneOTPVerified extends LoginStates {}

class AppSetLanguageState extends LoginStates {}

class UserRegisterSuccess extends LoginStates {
  final UserRegisterModel user;

  UserRegisterSuccess(this.user);
}

class UserRegisterError extends LoginStates {}
