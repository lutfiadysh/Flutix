import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
        UserEvent event,
      ) async* {
    if (event is LoadUser)
      {
        User user = await UserServices.getUser(event.id);

        yield UserLoaded(user);
      }
    else if (event is SignOut)
    {
      yield UserInitial();
    }
    else if (event is UpdateData)
    {
      User updatedUser = (state as UserLoaded)
          .user
          .copyWith(
          name: event.name,
          profilePicture: event.profileImage);
      await UserServices.updateUser(updatedUser);

      yield UserLoaded(updatedUser);
    }
    else if (event is TopUp)
    {
      if(state is UserLoaded)
        {
          try{
            User updateUser = (state as UserLoaded).user.copyWith(
              balance: (state as UserLoaded).user.balance + event.amount
            );

            await UserServices.updateUser(updateUser);

            yield UserLoaded(updateUser);
          }catch(e){
            print(e);
          }
        }
    }
    else if (event is Purchase)
    {
      if(state is UserLoaded)
      {
        try{
          User updateUser = (state as UserLoaded).user.copyWith(
              balance: (state as UserLoaded).user.balance -  event.amount
          );

          await UserServices.updateUser(updateUser);

          yield UserLoaded(updateUser);
        }catch(e){
          print(e);
        }
      }
    }
  }
}