part of 'pages.dart';

class WalletPage extends StatelessWidget {
  final PageEvent pageEvent;

  WalletPage(this.pageEvent);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        context.bloc<PageBloc>().add(pageEvent);

        return;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin,20,defaultMargin,0),
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          context.bloc<PageBloc>().add(pageEvent);
                        },
                        child: Icon(Icons.arrow_back,
                                color: Colors.black,),
                      ),
                      BlocBuilder<UserBloc,UserState>(
                        builder:(_,userState) =>  Column(
                          children: <Widget>[
                            Text(
                              "My Wallet",
                              style: blackTextFont.copyWith(fontSize: 20),
                            ),
                            //note: ID CARD
                            Container(
                              height: 185,
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:Color(0xFF382A74),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    offset: Offset(0,5),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: <Widget>[
                                  ClipPath(
                                    clipper:CardReflectionClipper(),
                                    child: Container(
                                      height: 185,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(
                                            begin:Alignment.bottomRight,
                                            end: Alignment.topLeft,
                                            colors:[
                                          Colors.white.withOpacity(0.1),
                                          Colors.white.withOpacity(0),
                                        ]),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(right: 4),
                                              height: 18,
                                              width: 18,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFFFFF2CB),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: accentColor2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(NumberFormat.currency(
                                          locale:'id-ID',
                                          symbol: 'IDR',
                                          decimalDigits: 0,
                                        ).format((userState as UserLoaded).user.balance),
                                        style: whiteNumberFont.copyWith(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text("Card Holder",
                                                style: whiteTextFont.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text((userState as UserLoaded).user.name,
                                                    style: whiteTextFont.copyWith(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    SizedBox(
                                                      height: 14,
                                                      width: 14,
                                                      child: Image.asset(
                                                        "assets/ic_check.png"
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text("Card ID",
                                                  style: whiteTextFont.copyWith(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text((userState as UserLoaded).user.id
                                                        .substring(0,10).toUpperCase(),
                                                      style: whiteNumberFont.copyWith(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    SizedBox(
                                                      height: 14,
                                                      width: 14,
                                                      child: Image.asset(
                                                          "assets/ic_check.png"
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("Recent Transaction",
                                style: blackTextFont,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            FutureBuilder(
                              future: TransactionServices.getTransaction((userState as UserLoaded).user.id),
                              builder: (_,snapshot) {
                                if(snapshot.hasData){
                                  return generateTransactionList(snapshot.data);
                                }else {
                                  return SpinKitFadingCircle(
                                    size: 50,
                                    color: mainColor,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Column generateTransactionList(List<MovieTransaction> transactions){
    return Column(
      children: transactions.map((e) => Text(e.title)).toList(),
    );
  }
}

class CardReflectionClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 15);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;

}