import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_ui/models/user_models.dart';

class user_details extends StatefulWidget {
  final User? user;
  user_details({this.user});

  @override
  State<user_details> createState() => _user_detailsState();


}

class _user_detailsState extends State<user_details> {

   bool large=false;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:CupertinoColors.lightBackgroundGray,
      appBar:AppBar(

        title:Text("Details"),
      ),
      body:SingleChildScrollView(
        child:Column(
          children: [
            Container(
                width:double.infinity,
                height:MediaQuery.of(context).size.width*.6,
                child:GestureDetector(
                  onDoubleTap:(){

                  },
                  child:Ink.image(image:AssetImage("${widget.user!.Image_URL}")),
                )
            ),
            Text("${widget.user!.Name}",
              style:TextStyle(
                fontSize:40,
                color:Colors.blueGrey,
                fontWeight:FontWeight.w900,
              ),
            ),

            Text("Last seen at ${widget.user!.Lastseen}"),
            // Text("FAVROITES",style:TextStyle(fontSize:30),)

          ],
        ),
      )
    );
  }
}
