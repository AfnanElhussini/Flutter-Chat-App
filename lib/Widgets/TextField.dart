// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget textField({TextEditingController? controller,String? hintText,String? warningMessage,bool email = false,context,bool obscure = false}){
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    textAlign: TextAlign.center,
    controller: controller,
    obscureText: obscure,
    decoration: InputDecoration(
      hintText: hintText,
      contentPadding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      prefixIcon: Icon(Icons.email),

    ),
    validator: (value){
      if(value!.isEmpty){
        return warningMessage;
      }
      else {
        if(email && value.contains('@') == false){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email is badly Formatted')));
          return 'Email is badly formatted';
        }else if(!email && obscure){
          if(value.length <2){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password is too short')));
            return 'invalid length';
          }
        }
      }
    },
  );
}