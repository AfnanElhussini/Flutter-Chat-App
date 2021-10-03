import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_firebase/screens/login.dart';
import 'package:flutter_firebase/screens/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
 static const String id= 'welcomescreen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
     children:[
       SizedBox(height: 25,),
       Container(
         height: 300,
  child: Image(image: AssetImage('assets/chatting.png'), fit: BoxFit.contain,),

  
),
       Text(' Hi There! \nWelcome to\n  Your APP' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),

       SizedBox(height: 50,),
       Padding(
         padding: const EdgeInsets.all(10.0),
         child: Row(
crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Expanded(
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(onSurface: Colors.orange),
                 onPressed: (){

                   Navigator.pushNamed(context, Register.id);
                 },
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('REGISTER', style: TextStyle(color: Colors.white, fontSize: 20, ),textAlign: TextAlign.center,),

                    // Icon(Icons.plus, color: Colors.white,)
                   ],
                 ),
               ),
             ),
             SizedBox(width: 28,),
             Expanded(
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(onSurface: Colors.orange),
                 onPressed: (){
                   Navigator.pushNamed(context, Login.id);
                 },
                 child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                       ),
                       SizedBox(width: 10,),
                       Icon(Icons.login, color: Colors.white,),
                     ],

                 ),
               ),
             ),
           ],
         ),
       )
          ]
        ),
      ),
    );
  }
}
