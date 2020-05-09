part of 'page_bloc.dart';

abstract class PageEvent extends Equatable{
  const PageEvent();
}

class GoToSplashPage extends PageEvent{
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent{
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent{
  @override
  List<Object> get props => [];
}

class GoToRegistrationPage extends PageEvent{
  final RegistrationData registrationData;

  GoToRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToPreferencesPage extends PageEvent{
  final RegistrationData registrationData;

  GoToPreferencesPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToAccountConfirationPage extends PageEvent{
  final RegistrationData registrationData;

  GoToAccountConfirationPage(this.registrationData);

  @override
  List<Object> get props => [];
}
