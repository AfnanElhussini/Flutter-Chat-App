import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget ElvatedButton({Widget? widget, Function()? function, Color color  = Colors.orange,String? text,bool isText=false}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      onPrimary: Colors.white,
      elevation: 4
    ),
    onPressed: function,
    child: isText? Text(text!,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),): widget
  );
}