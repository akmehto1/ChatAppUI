
import 'dart:ffi';
import 'package:chat_ui/models/message_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_ui/pages/Chatmessgage/chat_message.dart';
import 'package:chat_ui/models/message_models.dart';
class recent_chat extends StatefulWidget {
  const recent_chat({Key? key}) : super(key: key);

  @override
  State<recent_chat> createState() => _recent_chatState();
}



class _recent_chatState  extends State<recent_chat> {
  @override

  Widget build(BuildContext context) {
    return  Expanded(child: Container(
        height:300,
        width:double.infinity,
        color: Colors.white,
        child:ClipRRect(
        borderRadius:BorderRadius.only(
        topLeft:Radius.circular(30),
        topRight:Radius.circular(30),),
          child:ListView.builder(
              itemCount:message.length,
              itemBuilder:(BuildContext context,int index){
                final Message chats=message[index];
                return Container(
                  child:GestureDetector(

                    onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder:(_) => Chat_message(user:chats.sender)));
                    },
                    onLongPress:(){

                    },
                    child: Container(
                      margin:EdgeInsets.only(bottom:6,right:0),
                      padding:EdgeInsets.symmetric(horizontal:5,vertical:5),
                      decoration:BoxDecoration(
                        color:chats.unread!?Color(0xFFFFEFEE):Colors.white,
                        borderRadius:BorderRadius.only(topLeft:Radius.circular(20.0),bottomLeft:Radius.circular(20.0)),
                      ),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [

                              //chat user image
                              CircleAvatar(
                                radius:35,
                                backgroundImage:AssetImage("${chats.sender!.Image_URL}"),
                              ),
                              SizedBox(width:5),
                              //chat user name and message
                              Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text("${chats.sender!.Name}",style:TextStyle(color:Colors.grey,fontSize:13,fontWeight:FontWeight.w700),),
                                  SizedBox(height:3),
                                  Container(
                                    width:MediaQuery.of(context).size.width*.45,
                                    child:Text("${chats.text}",
                                      style:TextStyle(
                                          color:Colors.blueGrey,
                                          fontSize:15),
                                      overflow:TextOverflow.ellipsis
                                      ,),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(

                            child:Column(
                              children: [
                                Text("${chats.time}"),
                                Container(

                                  decoration:BoxDecoration(
                                    color:Colors.red,
                                    borderRadius:BorderRadius.circular(5),
                                  ),
                                  alignment:Alignment.center,
                                  child:chats.unread!?Text("NEW", style:
                                  TextStyle(fontSize:15,fontWeight:FontWeight.w900)):SizedBox.shrink(),
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );



              }
          ),
        )
      ));
  }
}
