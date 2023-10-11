
import 'dart:ffi';
import 'dart:io';

import 'package:chat_ui/models/message_list.dart';
import 'package:chat_ui/models/message_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_ui/models/user_models.dart';
import 'package:chat_ui/models/user_list.dart';
import 'package:chat_ui/pages/user_details/user_details.dart';
import 'package:image_picker/image_picker.dart';

class Chat_message extends StatefulWidget {
  final User?user;
  Chat_message({this.user});
    @override

  State<Chat_message>  createState() => _Chat_messageState();


}

class _Chat_messageState extends State<Chat_message> {

  File? imagefile;
  final ImagePicker imagePicker=ImagePicker();
  pick_image(){
    showDialog<void>(
      context: context,
      barrierDismissible:true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Select Image'),
          actions: <Widget>[
            Center(
              child:Column(
                children: [

                  //gallery image
                  TextButton(
                    child: Text('Gallery',style:TextStyle(fontSize:25,color:Colors.blueGrey)),
                    onPressed: () async{
                      final image= await imagePicker.pickImage(source: ImageSource.gallery);
                      if(image== null) return ;
                      imagefile=File(image.path);
                      Navigator.of(dialogContext).pop();
                      showDialog<void>(
                        context: context,
                        barrierDismissible:true,
                        // false = user must tap button, true = tap outside dialog
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                              title:Image.file(
                              imagefile!),

                              actions: [
                                ElevatedButton(
                                    onPressed:(){
                                      Navigator.of(dialogContext).pop();

                                    },
                                    child:Text("Select")),

                                ElevatedButton(
                                    onPressed:(){

                                      Navigator.of(dialogContext).pop();

                                    },
                                    child:Text("Cancel"))

                              ],

                          );
                        },
                      );
                    },
                  ),


                  //select imaeg from camera
                  TextButton(
                    child: Text('Camera',style:TextStyle(fontSize:25,color: Colors.blueGrey)),
                    onPressed: () async{
                      final image= await imagePicker.pickImage(source: ImageSource.camera);
                      if(image== null) return ;
                      imagefile=File(image.path);
                      Navigator.of(dialogContext).pop();
                      showDialog<void>(
                        context: context,
                        barrierDismissible:true,
                        // false = user must tap button, true = tap outside dialog
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title:Image.file(
                                imagefile!),

                            actions: [
                              ElevatedButton(
                                  onPressed:(){
                                    Navigator.of(dialogContext).pop();

                                  },
                                  child:Text("Select")),

                              ElevatedButton(
                                  onPressed:(){

                                    Navigator.of(dialogContext).pop();

                                  },
                                  child:Text("Cancel"))

                            ],

                          );
                        },
                      );
                       // Dismiss alert dialog
                    },
                  ),

                  //select video from gallery

                ],
              ),
            )
          ],
        );
      },
    );
  }

  _buildmsgcomposer(){
    return Container(
      height:50,
      padding:EdgeInsets.symmetric(horizontal:8),
      width:double.infinity,
      color:Colors.red,
      child:Row(
        children: [
          IconButton(
              onPressed:(){
                pick_image();
              },
              icon:Icon(Icons.image),
              iconSize:35,
          ),

          IconButton(
              onPressed: (){},
              icon:Icon(Icons.attachment_outlined),
              iconSize:35,
          ),
          Expanded(child:TextField(
            decoration:InputDecoration(
              hintText:"Send the message",
            ),
          )
          ),

          IconButton(
              onPressed: (){},
              icon:Icon(Icons.send)),

        ],
      ),
    );
  }

    _build_msg(Message msg,bool isme){
      return  Container(
        width:100,

        margin:isme ?EdgeInsets.only(
            left:MediaQuery.of(context).size.width*.4,top:5) :
        EdgeInsets.only(
            right:MediaQuery.of(context).size.width*.4,top:5),

        decoration:BoxDecoration(
          color:isme?Colors.grey:Colors.brown,

          borderRadius:
          isme?BorderRadius.only(
              topLeft:Radius.circular(10),
              bottomLeft:Radius.circular(10)):
          BorderRadius.only(
              topRight:Radius.circular(10),
              bottomRight:Radius.circular(10)),
        ),

      child:Padding(padding:EdgeInsets.all(13),
              child:Column(
                children: [
                  Text("${msg.time}"),
                  Text("${msg.text}",style:TextStyle(fontSize:20),),
                  Row(
                    mainAxisAlignment:isme?MainAxisAlignment.end:MainAxisAlignment.start,
                    children: [
                     isme?Container(
                       padding:EdgeInsets.only(left:20),
                       width:50,
                       height:20,
                       child:IconButton(
                         onPressed:(){},
                         icon:Icon(Icons.heart_broken),
                       ),
                     ):SizedBox.shrink()
                    ],
                  )
                ],
              )

      ),

      );
    }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar:AppBar(

         title:Container(

           color:Colors.white12,
           child:Row(
             mainAxisAlignment:MainAxisAlignment.spaceBetween,
             children:
           [
             //profile image
             CircleAvatar(
               radius:25,
               backgroundImage:AssetImage("${widget.user!.Image_URL}"),
             ),
             //name of the person
             GestureDetector(
               onLongPress:(){
                 print("statuss");
               },
               onTap:(){
                 Navigator.push(context,MaterialPageRoute(builder:(_) => user_details(user:widget.user!)));

               },
               child:Column(
                 mainAxisAlignment:MainAxisAlignment.spaceBetween,
                 crossAxisAlignment:CrossAxisAlignment.start,
                 children: [
                   Text("${widget.user!.Name}"),
                   Text("last seen today at ${widget.user!.Lastseen}",style:TextStyle(fontSize:10),),
                 ],
               ),
             ),
             Icon(Icons.call),
             Icon(Icons.video_call),
             Icon(Icons.egg),

             
           ],),
         )
       ),




      body:Column(
        children: [
          Expanded(child:Container(



            child:ListView.builder(
                itemCount:11,
                reverse:true,
                itemBuilder:(BuildContext context,int index) {
                  final Message msg=message[index];
                  final bool isme=msg.sender!.id==CurrentUser.id;

                  return  _build_msg(msg,isme);
                }),
          )
          ),

         _buildmsgcomposer(),

        ],
      )


    );
  }

}
