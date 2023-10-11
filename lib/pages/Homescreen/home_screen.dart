
import 'package:chat_ui/models/message_models.dart';
import 'package:chat_ui/pages/Homescreen/favorite_contact.dart';
import 'package:chat_ui/pages/Homescreen/recent_chat.dart';
import 'package:flutter/material.dart';

import 'categroy_selector.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomeScreen();
}


class _MyHomeScreen extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).primaryColor,
      appBar: AppBar(
        //leading
        leading:IconButton(
          icon:Icon(Icons.menu),
          iconSize:40,
          onPressed: (){},
        ),


        //title
        title:Center(child:
        Text("Chat",
          style: TextStyle(
              fontSize:45)  ),
            ),


      //right part
      elevation:0.0,
      actions: [
        IconButton(
            onPressed:(){},
            icon:Icon(Icons.search),
            iconSize:30,

        ),
      ],

      ),

      body:Column(
        children: [
          catagroy_selector(),
          Expanded(
              child:Container(


                    decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius:BorderRadius.only(
                    topLeft:Radius.circular(30),
                    topRight:Radius.circular(30),
                     )  ),


                child: Column(
                  children:[
                    //fovrate selection column
                    favorite_contact(),
                     recent_chat()

                  ],
                ),
              )
          )

        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
