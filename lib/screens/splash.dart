import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
            color:Color(0xFF6CE4AC),
          height: myHeight,
          width: myWidth,
          child: Column(
            children: [
              Image.asset('assets/images/loading.gif'),
              Text(
                'Coin Wallet',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,  color: Colors.white,),
              ), ///text
              Container(
                decoration:BoxDecoration(
                color:Colors.red,
                borderRadius:BorderRadius.circular(50)),//box decoration
                child, Row(
                  children: [
                    Text:('Enter',
                    style:TextStyle(
                      fontSize:20,
                      fontWeight:FontWeightf.normal,
                      color:colors:white,
                    )//textstyle
                    )//text
                  ]
                )

              )
            ],
          ),
        ), //container
      ), //scaffold
    ); //safeArea
  }
}
