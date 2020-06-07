part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  final Ticket ticket;

  CheckoutPage(this.ticket);
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    int total = 26500 * widget.ticket.seats.length;
    return WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToSelectSeatPage(widget.ticket));
          return;
        },
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                color: accentColor1,
              ),
              SafeArea(
                child: Container(
                  color:Colors.white,
                ),
              ),
              //Back BUTTON
              ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20, left: defaultMargin),
                            padding: EdgeInsets.all(1),
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .bloc<PageBloc>()
                                    .add(GoToSelectSeatPage(widget.ticket));
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // PAGE TITLE
                      BlocBuilder<UserBloc,UserState>(
                        builder: (_,userState){
                          User user = (userState as UserLoaded).user;

                          return Column(
                            children: <Widget>[
                              Container(
                                margin:EdgeInsets.symmetric(vertical: 20),
                                child: Text("Checkot \n Movie",
                                  style: blackTextFont.copyWith(fontSize: 20),
                                  textAlign: TextAlign.center  ,),
                              ),
                              // Movie DESC
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 90,
                                    width: 70,
                                    margin: EdgeInsets.only(left: defaultMargin,right: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(imageBaseURL + 'w342' + widget.ticket.movieDetail.posterPath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                          width:MediaQuery.of(context).size.width - 2 * defaultMargin - 90,
                                          child: Text(widget.ticket.movieDetail.title,
                                            style: blackTextFont.copyWith(fontSize: 18),
                                                   maxLines: 2,
                                                   overflow: TextOverflow.clip,
                                          )
                                      ),
                                      Container(
                                          width:MediaQuery.of(context).size.width - 2 * defaultMargin - 90,
                                          margin: EdgeInsets.symmetric(vertical: 6),
                                          child: Text(widget.ticket.movieDetail.genresAndLanguage,
                                            style: greyTextFont.copyWith(fontSize: 12,fontWeight: FontWeight.w400),
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                          )
                                      ),
                                      RatingStars(voteAverage: widget.ticket.movieDetail.voteAverage,
                                      color: accentColor3,),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20,horizontal: defaultMargin),
                                child: Divider(
                                  color: Color(0xFFE4E4E4),
                                  thickness: 1 ,
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: defaultMargin ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Order ID",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),),
                                    Text(widget.ticket.bookingCode,
                                      style: whiteNumberFont
                                          .copyWith(
                                          color:Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: defaultMargin ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Order ID",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.55,
                                      child: Text(widget.ticket.theater.name,
                                        textAlign: TextAlign.end,
                                        style: whiteNumberFont
                                            .copyWith(
                                            color:Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: defaultMargin ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Date & Time",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),),
                                    Text(widget.ticket.date.dateAndTime,
                                      style: whiteNumberFont
                                          .copyWith(
                                          color:Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:9,
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: defaultMargin ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Seat Numbers",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.55,
                                      child: Text(widget.ticket.seatsInString,
                                        textAlign: TextAlign.end,
                                        style: whiteNumberFont
                                            .copyWith(
                                            color:Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: defaultMargin ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Price",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),),
                                    Text(
                                      "IDR 25.000 X ${widget.ticket.seats.length}",
                                      style: whiteNumberFont
                                          .copyWith(
                                          color:Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: defaultMargin ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Fee",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),),
                                    Text(
                                      "IDR 1.500 X ${widget.ticket.seats.length}",
                                      style: whiteNumberFont
                                          .copyWith(
                                          color:Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: defaultMargin ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Total",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        decimalDigits: 0,
                                        symbol: 'IDR ',
                                      ).format(total),
                                      style: whiteNumberFont
                                          .copyWith(
                                          color:Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20,horizontal: defaultMargin),
                                child: Divider(
                                  color: Color(0xFFE4E4E4),
                                  thickness: 1 ,
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: defaultMargin ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Your Wallet",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        decimalDigits: 0,
                                        symbol: 'IDR ',
                                      ).format(user.balance),
                                      style: whiteNumberFont
                                          .copyWith(
                                          color: user.balance >= total ? Color(0xFF3E9D9D) : Color(0xFFE39D9D)  ,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width:250,
                                height:46,
                                margin:EdgeInsets.only(top: 36,bottom:50),
                                child: RaisedButton(
                                  elevation: 0,
                                  color: user.balance >= total
                                      ? Color(0xFF3E9D9D)
                                      : mainColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:BorderRadius.circular(8),
                                  ),
                                  child:Text(user.balance >= total
                                      ? "Checkout Now"
                                      : "Top Up My Wallet",
                                  style: whiteTextFont
                                      .copyWith(fontSize: 16),),
                                  onPressed: (){
                                    if(user.balance >= total){
                                      // Wallet is Enough

                                      MovieTransaction transaction = MovieTransaction(
                                        userID: user.id,
                                        title:widget.ticket.movieDetail.title,
                                        subtitle: widget.ticket.theater.name,
                                        date: DateTime.now(),
                                        amount: -total,
                                        picture: widget.ticket.movieDetail.posterPath,
                                      );

                                      context.bloc<PageBloc>().add(GoToSuccessPage(
                                          widget.ticket.copyWith(
                                            totalPrice: total,
                                          ),
                                          transaction));
                                    }else{
                                      //Wallet Not Enough
                                    }
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
