//navbar
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'generateKey.dart';
import '../providers/walletProvider.dart';
import 'import.dart';


 class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    ImportWallet(),
    GenerateKeyScreen(),

  ];

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: pages.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xff494F55),
          unselectedItemColor: Colors.grey,
           backgroundColor: Color(0xffFBC700),
          onTap: _changePage,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/home1.png',
                height: myHeight * 0.05,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/images/home2.png',
                height: myHeight * 0.05,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/wallet1.png',
                height: myHeight * 0.05,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/images/wallet2.png',
                height: myHeight * 0.05,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/add1.png',
                height: myHeight * 0.05,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/images/add2.png',
                height: myHeight * 0.05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
