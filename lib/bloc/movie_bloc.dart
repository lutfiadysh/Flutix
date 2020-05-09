import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';

part 'movie_state.dart';
part 'movie_event.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  @override
  MovieState get initialState => MovieInitial();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if(event is FetchMovies){
      List<Movie> movies = await MovieServices.getMovies(1);

      yield MovieLoaded(movies: movies);
    }
  }
}
