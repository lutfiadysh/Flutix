import 'package:flutix/bloc/bloc.dart';
import 'package:flutix/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutix/ui/pages/pages.dart';
import 'package:provider/provider.dart';
import 'package:flutix/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => ThemeBloc()),
          BlocProvider(create: (_) =>
            MovieBloc()..add(FetchMovies()),),
          BlocProvider(create: (_) => TicketBloc(),)
        ],
        child: BlocBuilder<ThemeBloc,ThemeState>(builder:
            (_, themeState) => MaterialApp(
              theme: themeState.themeData,
              debugShowCheckedModeBanner: false,
              home: Wrapper()
          ),
        ),
      ),
    );
  }
}