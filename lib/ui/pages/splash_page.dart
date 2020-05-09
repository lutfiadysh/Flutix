part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 235,
              child: FlareActor(
                "assets/tree.flr",
                alignment: Alignment.center,
                animation:"empty",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:70,bottom: 16),
              child:Text(
                  "New Experiences",
                  style: blackTextFont.copyWith(fontSize: 20),
              )
            ),
            Text("Watch a new movie much\neasier than any before",
              style:greyTextFont.copyWith(fontSize: 16, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 250,
              height: 46,
              margin: EdgeInsets.only(top: 70,bottom: 19),
              child: RaisedButton(
                  child: Text("Get started" , style: whiteTextFont.copyWith(fontSize: 16),),
                  color: mainColor,
                  onPressed: (){
                    context.bloc<PageBloc>().add(GoToRegistrationPage(RegistrationData()));
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account ? ",
                  style: greyTextFont.copyWith(fontWeight: FontWeight.w400),),
                GestureDetector(
                  onTap: (){
                    context.bloc<PageBloc>().add(GoToLoginPage());
                  },
                  child: Text("Sign In",
                    style: purpleTextFont,),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
