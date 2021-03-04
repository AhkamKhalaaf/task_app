
import 'package:flutter/material.dart';
AppBar customAppBar (String textValue ,Color colorArrow)
{
  return  AppBar(elevation: 0.0,titleSpacing: 0.0,
    iconTheme: IconThemeData(color:colorArrow),
    centerTitle: true,title: Text(textValue
      ,textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 25.0,
          fontWeight: FontWeight.bold),),actions: [
     IconButton(icon:  Icon(Icons.location_on,size: 35.0,color:colorArrow ,), onPressed: (){})
      ],
  
 //  ImageIcon(AssetImage('assets/icons/gpsicon.png'),size: 15.0
//    ,color: colorArrow,),
  );

}