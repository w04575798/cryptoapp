import 'package:flutter/material.dart';
import '../utils.dart';

class HomeScreen extends StatelessWidget { 

    @override 
    Widget build(BuildContext context ) { 
        return Scaffold(

            backgroundColor: const Color(0xff494F55),
            body:
            Padding( SingleChildScrollView(
                padding:const EdgeInsets.only(left:20.0, right:20, top:50),
                child:Column(
                    children: [
                        Text("Crypto Market", style: textStyle(24, Colors.white, FontWeight.bold), )
                        //text
                    
                    ]
                ),//column
            ),//singlechildscrollview

        )); //padding /scaffold
        
    }
}