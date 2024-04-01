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
                physics: ScrollPhysics(),
                child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text("Crypto Market", style: textStyle(24, Colors.white, FontWeight.bold), 
                        
                        ),                        //text

                        ListView.builder(  
                            shrinkWrap: true,
                            physics: NeverScrollableSCrollPhysics(),
                            itemCount: 10, 
                            itemBuilder: (context, index) {
                                
                                return Padding( 
                                    padding: const EdgeInsets.only(bottom: 15.0),
                                    child: Container(
                                width:MediaQuery.of(Context)
                                height: 60,
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween

                                    children:[
                                        Container(
                                    width:60,
                                    height:60,
                                    decoration:BoxDecoration(
                                           colors:Colors.grey[700],
                                           borderRadius:BorderRadius.circular(15)
                                            boxShadow: [BoxShadow(color:colors.grey[700]!,
                                            offset: const Offset(4, 4),
                                            blurRadius: 5
                                             )//boxShadow
                                            ]

                                    ),//boxDecoration
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1200px-Bitcoin.svg.png')
                                    ), //padding
                                        )//Container
                                        cons SizedBox(width:20, )
                                        Column (
                                        children:[
                                            Text("Bitcoin", style: textStyle(18, Colors.white, FontWeight.w600),
                                            )
                                        ]
                                        )
                                    ],
                                )//row
                                
                                )//container
                                );//padding
                            },
                             )//Listview.builder
                    ],
                ),//column

            ),//singlechildscrollview

        )); //padding /scaffold
        
    }
}