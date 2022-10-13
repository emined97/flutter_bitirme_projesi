import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bitirme_projesi/const/bitirme_const.dart';
import 'package:flutter_bitirme_projesi/view/list_page.dart';
import 'package:flutter_bitirme_projesi/view/login_page.dart';
import 'package:flutter_bitirme_projesi/view/page_detail.dart';
import 'package:flutter_bitirme_projesi/view/signup_page.dart';
import 'package:flutter_bitirme_projesi/view/user_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  List<Widget> _bottomList = [
    LoginPage(),
    ListPage(),
    PageDetail(),
    UserScreen(),
    SignupPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        selectedItemColor: BitirmeConst.colorblue,
        unselectedItemColor: BitirmeConst.colorgrey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'Appointments'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: _bottomList.elementAt(_selectedIndex),
    );
  }
}
