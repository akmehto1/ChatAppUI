import 'package:chat_ui/models/fav_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_ui/models/message_list.dart';
import 'package:chat_ui/pages/Chatmessgage/chat_message.dart';
import 'package:chat_ui/models/message_models.dart';
class favorite_contact extends StatefulWidget {
  const favorite_contact({Key? key}) : super(key: key);

  @override
  State<favorite_contact> createState() => _favorite_contactState();
}

class _favorite_contactState extends State<favorite_contact> {
  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Favorite Contact",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey,
                ),
              ),
              //icon button
              IconButton(
                onPressed: () {
                  print("hello");
                },
                icon: Icon(Icons.more_horiz_sharp),
                iconSize: 30.0,
                color: Colors.blueGrey,
              )
            ],
          ),
        ),
        Container(
          height:110,
          child: ListView.builder(
              scrollDirection:Axis.horizontal,
               padding:EdgeInsets.only(left:10.0),
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, int index) {
                final Message chats=message[index];
                return GestureDetector(
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder:(_) => Chat_message(user:favorites[index])));
                  },
                  child:Container(

                    width:120,

                    child:Column(
                      children: [
                        CircleAvatar(
                            radius:35,
                            backgroundImage:AssetImage("${favorites[index].Image_URL}")
                        ),
                        Text("${favorites[index].Name}",
                          style:TextStyle(
                              fontSize:13,
                              color:Colors.blueGrey,
                              fontWeight:FontWeight.w600),)
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
