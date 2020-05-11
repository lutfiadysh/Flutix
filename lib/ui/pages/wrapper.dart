part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    if(firebaseUser == null){

      if(!(prevPageEvent is GoToSplashPage)){

        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
      context.bloc<PageBloc>().add(GoToSplashPage());
    }
    else{

      if(!(prevPageEvent is GoToMainPage)){
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
      context.bloc<PageBloc>().add(GoToMainPage());
    }

    return BlocBuilder<PageBloc,PageState>(builder:
        (_, pageState) =>
        (pageState is OnSplashPage) ? SplashPage()
        : (pageState is OnLoginPage) ? SignInPage()
        : (pageState is OnRegistrationPage) ? SignUpPage(pageState.registrationData)
        : (pageState is OnPreferencesPage) ? PreferencePage(pageState.registrationData)
        : (pageState is OnAccountConfirmationPage) ? AccountConfirmationPage(pageState.registrationData)
        : (pageState is OnMovieDetailPage) ? MovieDetailPage(pageState.movie)
        : (pageState is OnSelectSchedulePage) ? SelectSchedulePage(pageState.movieDetail)
        : (pageState is OnSelectSeatPage) ? SelectSeatPage(pageState.ticket)
        : (pageState is OnCheckoutPage) ? CheckoutPage(pageState.ticket)
        : MainPage());
  }
}