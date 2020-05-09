import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';


class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if(event is GoToSplashPage){
      yield OnSplashPage();
    }else if(event is GoToLoginPage){
      yield OnLoginPage();
    }else if(event is GoToMainPage){
      yield OnMainPage();
    }else if(event is GoToRegistrationPage){
      yield OnRegistrationPage(event.registrationData);
    }else if(event is GoToPreferencesPage){
      yield OnPreferencesPage(event.registrationData);
    }else if(event is GoToAccountConfirationPage){
      yield OnAccountConfirmationPage(event.registrationData);
    }else if (event is GoToMovieDetailPage){
      yield OnMovieDetailPage(event.movie);
    }else if (event is GoToSelectSchedulePage){
      yield OnSelectSchedulePage(event.movieDetail);
    }
  }
}
