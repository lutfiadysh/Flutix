part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blueGrey[50],
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          MoviePage(),
          Center(
            child: TicketPage(),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.centerLeft,
          colors: [
            Color(0xFFa19e0e),
            accentColor2,
          ],
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 24.0,
            color: mainColor.withOpacity(0.22),
            offset: Offset(0, 16.0),
          ),
          BoxShadow(
            blurRadius: 6.0,
            color: mainColor.withOpacity(0.14),
            offset: Offset(0, 2.0),
          ),
          BoxShadow(
            blurRadius: 1.0,
            color: Colors.black.withOpacity(0.08),
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {
          context.bloc<PageBloc>().add(GoToTopUpPage(GoToMainPage()));
        },
        child: Icon(Icons.account_balance_wallet),
        backgroundColor: Colors.transparent,
        splashColor: mainColor.withOpacity(0.25),
        elevation: 0.0,
        hoverElevation: 0.0,
        highlightElevation: 0.0,
        focusElevation: 0.0,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0),
      ),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: mainColor,
          unselectedItemColor: Color(0xFFE5E5E5),
          elevation: 0.0,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library),
              title: Text('Movies'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_play),
              title: Text('My Tickets'),
            ),
          ],
        ),
      ),
    );
  }
}


