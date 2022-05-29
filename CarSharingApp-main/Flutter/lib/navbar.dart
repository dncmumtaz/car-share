import 'package:carshare/blocs/application_bloc.dart';
import 'package:carshare/google_map_screens/google_map_screen.dart';
import 'package:carshare/login_page/login_page_widget.dart';
import 'package:carshare/models/saved_trip_model.dart';
import 'package:carshare/models/user_model.dart';
import 'package:carshare/user_login.dart';
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
/*
import 'package:picker_packer/model/user_login.dart';

import 'picker_profile_widget.dart';
import 'picker_orders_widget.dart';
import 'picker_order_history_widget.dart';
*/
class NavBarPage extends StatefulWidget {
  final UserModel user;
  NavBarPage({Key key, this.initialPage,  @required this.user}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState(user);
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> with SingleTickerProviderStateMixin{
  UserModel user;
  String _currentPage = 'JoinTripFirstPage';
  _NavBarPageState(UserModel user) {
    this.user = user;

  }

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
    print('AAAAAAAAAAAAAA\n\n\n\nAAAAAAAAAA\n\n\n\nAAAAAAAAA');
    print(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'JoinTripFirstPage': JoinTripFirstPageWidget(),
      'CreateTripFirstPage': CreateTripFirstPageWidget(),
      'messages': MessagesWidget(),
      'profilePage': ProfilePageWidget(user: user),
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
