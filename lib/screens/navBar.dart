import 'package:flutter/material.dart';
 class NavBar extends StatefulWidget { 
    const NavBar({super.key});

    @override
    State<NavBar>CreateState()=> _NavBarState();
 }

 class _NavBarState extends State<NavBar> { 
    int _currentIndex=0;
    List<Widgets> pages = [

        Home ()
    ];
    @override
    Widget build(BuildContext context) { 
         double myHeight= MediaQuery.of(context).size.height;
         double myWidth = MediaQuery.of(context).size.width;
        return SafeArea(
            child: Scaffold(
                   backgroundColor:Colors.white,


            )
        );//safearea
    }
 }