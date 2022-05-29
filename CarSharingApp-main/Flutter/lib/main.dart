// @dart=2.9
import 'package:carshare/blocs/application_bloc.dart';
import 'package:carshare/google_map_screens/google_map_screen.dart';
import 'package:carshare/login_page/login_page_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:carshare/profile_page/profile_page_widget.dart';
import 'package:provider/provider.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'join_trip_first_page/join_trip_first_page_widget.dart';
import 'create_trip_first_page/create_trip_first_page_widget.dart';
import 'messages/messages_widget.dart';
import 'profile_page/profile_page_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicatonBloc(),

      child: MaterialApp(

        title: 'carshare',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', '')],
        theme: ThemeData(primarySwatch: Colors.blue),
 //       home: GoogleMapScreen(),
        home: LoginPageWidget(),
      ),
    );
  }
}
/*
class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'JoinTripFirstPage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'JoinTripFirstPage': JoinTripFirstPageWidget(),
      'CreateTripFirstPage': CreateTripFirstPageWidget(),
      'messages': MessagesWidget(),
      'profilePage': ProfilePageWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_sharp,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.search,
              size: 24,
            ),
            label: 'Join',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.create,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.create,
              size: 24,
            ),
            label: 'Create',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline_sharp,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.chat_bubble,
              size: 24,
            ),
            label: 'Messages',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 24,
            ),
            label: 'Profile',
            tooltip: '',
          )
        ],
        backgroundColor: Colors.black,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Color(0xFF2596BE),
        unselectedItemColor: Color(0x8AFFFFFF),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

*/