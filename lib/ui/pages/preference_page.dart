part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final List<String> genres = [
    "Horror",
    "Music",
    "Action",
    "Drama",
    "War",
    "Crime",
  ];
  final List<String> language = [
    "Bahasa",
    "English",
    "Japanese",
    "Korean"
  ];
  final RegistrationData registrationData;

  PreferencePage(this.registrationData);
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  ()async {
        widget.registrationData.password = "";
        context.bloc<PageBloc>().add(GoToRegistrationPage(widget.registrationData));
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 56,
                    margin: EdgeInsets.only(top: 20,bottom: 4),
                    child: GestureDetector(
                        onTap: (){
                          widget.registrationData.password = "";
                          context.bloc<PageBloc>().add(GoToRegistrationPage(widget.registrationData));
                        },
                        child: Icon(Icons.arrow_back)),
                  ),
                  Text(
                      "Select Your Favorite Genres",
                    style: blackTextFont.copyWith(fontSize: 30),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateGenreWidgets(context),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Movie Language \n You Prefer ?",
                  style: blackTextFont.copyWith(fontSize: 20),),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateLanguageWidgets(context),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: mainColor,
                      child: Icon(Icons.arrow_forward),
                      onPressed: (){
                        if(selectedGenres.length != 4){

                        }else {
                          widget.registrationData.selectedGenres = selectedGenres;
                          widget.registrationData.selectedLanguage = selectedLanguage;

                          context.bloc<PageBloc>().add(GoToAccountConfirationPage(widget.registrationData));
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  List<Widget> generateGenreWidgets(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 3 * defaultMargin  ) / 2;

    return widget.genres.map((e) => SelectableBox(
      e,
      width: width,
      isSelected: selectedGenres.contains(e),
      OnTap: (){
        onSelectGenre(e);
        },
    )).toList();
  }

  List<Widget> generateLanguageWidgets(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 3 * defaultMargin  ) / 2;

    return widget.language.map((e) => SelectableBox(
      e,
      width: width,
      isSelected: selectedLanguage == e,
      OnTap: (){
        setState(() {
          selectedLanguage = e;
        });
      },
    )).toList();
  }

  void onSelectGenre(String genre) {
    if(selectedGenres.contains(genre)){
      setState(() {
        selectedGenres.remove(genre);
      });
    }else {
      if(selectedGenres.length<4){
        setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }
}
