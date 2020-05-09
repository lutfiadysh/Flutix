part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationPage(this.registrationData);
  @override
  _AccountConfirmationPageState createState() => _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        context.bloc<PageBloc>().add(GoToPreferencesPage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 90),
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToPreferencesPage(widget.registrationData));
                            },
                            child: Icon(Icons.arrow_back, color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Confirm \nNew Account",
                            style: blackTextFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: (widget.registrationData.profileImage == null) ?
                      AssetImage("assets/user.png") : FileImage(widget.registrationData.profileImage),
                      fit: BoxFit.cover)
                    ),
                  ),
                  Text(
                    "Welcome",
                    style: blackTextFont.copyWith(fontSize: 16,fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "${widget.registrationData.name}",
                        textAlign: TextAlign.center,
                        style: blackTextFont.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  (isSigningUp)
                      ? SpinKitFadingCircle(
                        color: Color(0xFF3E9D9D), size: 45,)
                      : SizedBox(
                        width: 250,
                        height: 45,
                      child: RaisedButton(
                        color: Color(0xFF3E9D9D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text("Create My Account",style: whiteTextFont.copyWith(fontSize: 16),),
                        onPressed: ()async{
                          setState(() {
                            isSigningUp = true;
                          });

                          imageFileToUpload =
                              widget.registrationData.profileImage;

                         SignInSignUpResult result =  await AuthServices.signUp(widget.registrationData.email,
                              widget.registrationData.password,
                              widget.registrationData.name,
                              widget.registrationData.selectedGenres,
                              widget.registrationData.selectedLanguage);
                         if(isSigningUp = null){
                           setState(() {
                             isSigningUp = false;
                           });
                           Alert(
                             context: context,
                             type: AlertType.warning,
                             title: "SignUp Failed",
                             desc: result.message,
                             buttons: [
                               DialogButton(
                                 child: Text(
                                   "COOL",
                                   style: TextStyle(color: Colors.white, fontSize: 20),
                                 ),
                                 onPressed: () => Navigator.pop(context),
                                 width: 0,
                               )
                             ],
                           ).show();
                         }
                      },
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
