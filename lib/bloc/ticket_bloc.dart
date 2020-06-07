import 'dart:async';

import 'package:flutix/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:flutix/services/services.dart';
import 'package:flutix/models/models.dart';
import 'package:equatable/equatable.dart';



part 'ticket_state.dart';
part 'ticket_event.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  @override
  TicketState get initialState => TicketState([]);

  @override
  Stream<TicketState> mapEventToState(
    TicketEvent event,
  ) async* {
    if(event is BuyTicket)
      {
        await TicketServices.saveTicket(event.userID,event.ticket);

        List<Ticket> tickets = state.tickets + [event.ticket];

        yield TicketState(tickets);
      }
    else if (event is GetTicket)
      {
        List<Ticket> tickets = await TicketServices.getTickets(event.userID);

        yield TicketState(tickets);
      }
  }
}
