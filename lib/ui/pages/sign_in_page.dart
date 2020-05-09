part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));

    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());

        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 100,
                    width: 150,
                    child: FlareActor(
                      "assets/tree.flr",
                      animation: "empty",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70, bottom: 40),
                    child: Text(
                      "Welcome Back,\nExplorer!",
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isEmailValid = EmailValidator.validate(text);
                      });
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email Address",
                        hintText: "Email Address"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isPasswordValid = text.length >= 6;
                      });
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                        hintText: "Password"),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Forgot Password? ",
                        style: greyTextFont.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Get Now",
                        style: purpleTextFont.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 40, bottom: 30),
                      child: isSigningIn
                          ? SpinKitFadingCircle(
                        color: mainColor,
                      )
                          : FloatingActionButton(
                          elevation: 0,
                          child: Icon(
                            Icons.arrow_forward,
                            color: isEmailValid && isPasswordValid
                                ? Colors.white
                                : Color(0xFFBEBEBE),
                          ),
                          backgroundColor: isEmailValid && isPasswordValid
                              ? mainColor
                              : Color(0xFFE4E4E4),
                          onPressed: isEmailValid && isPasswordValid
                              ? () async {
                            setState(() {
                              isSigningIn = true;
                            });

                            SignInSignUpResult result =
                            await AuthServices.signIn(
                                emailController.text,
                                passwordController.text);

                            if (result.user == null) {
                              setState(() {
                                isSigningIn = false;
                              });
                            }
                          }
                              : null),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Start Fresh Now? ",
                        style:
                        greyTextFont.copyWith(fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Sign Up",
                        style: purpleTextFont,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
