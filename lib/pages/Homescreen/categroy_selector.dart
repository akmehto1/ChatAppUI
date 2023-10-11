import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class catagroy_selector extends StatefulWidget {

  @override
  State<catagroy_selector> createState() => _catagroy_selectorState();
}

class _catagroy_selectorState extends State<catagroy_selector> {
  @override
  int selectedindex=0;
  final List<String> categories=["Message","Groups","Status","Request"];
  Widget build(BuildContext context) {
    return Container(
      color:Theme.of(context).primaryColor,
      height:90,
      child:ListView.builder(
          itemCount:categories.length,
          scrollDirection:Axis.horizontal,
          itemBuilder:(BuildContext context,int index){
          return GestureDetector(
            onTap:(){
              setState(() {
                selectedindex=index;
              });
            },
            child:Padding(
            padding:EdgeInsets.symmetric(horizontal:20,vertical:15),
            child:
            Text(categories[index],
              style:TextStyle(
                   color: index==selectedindex ?Colors.white:Colors.black,
                  fontSize:30,
                  fontWeight:FontWeight.w600),),
          ),
          );
          }

      ),


    );
  }}
