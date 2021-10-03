import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/login.dart';

import 'chat_screen.dart';
class Chats extends StatefulWidget {
  static const id= 'chats_Screen';
  const Chats({Key? key}) : super(key: key);
  @override
  _ChatsState createState() => _ChatsState();
}
class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: AppBar(
      leading: IconButton(onPressed: (){
        Navigator.pop(context, Login.id);
      }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,),),
      centerTitle: true,

      backgroundColor: Colors.orange,
      title: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/chatt.png', height: 25,),
            Text(
              'ChatMe', style: TextStyle(color: Colors.white, ),),],),
      ),
    ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, ChatScreen.id);
            },
            child: Container(

              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                children: [
                  Container(
padding: EdgeInsets.all(2),

decoration: BoxDecoration(
borderRadius: BorderRadius.all(Radius.circular(40)),
  border: Border.all(
    width: 2,
    color: Colors.orange,
  ),
  boxShadow: [ BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 2,
  blurRadius: 5,
)]), child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/mikasa.jpg', ),
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width*0.65,
padding: EdgeInsets.only(left:20,),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Mikasa Akraman ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),),],
                        ),
                        SizedBox(height: 5,),
                        Container(

                          alignment: Alignment.topLeft,
                          child: Text(
                            'Eren! Nigraaaaaaaaa', style: TextStyle(
                            fontSize: 17, color: Colors.black54
                          ), overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
          SizedBox(height: 10,),

          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        width: 2,
                        color: Colors.orange,
                      ),
                      boxShadow: [ BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )]), child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/levi.jpg', ),
                ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.65,
                  padding: EdgeInsets.only(left:20,),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Levi Akraman ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),),],
                      ),
                      SizedBox(height: 5,),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'I want to put an end that recurring nightmare, right now. There are those who would get in my way', style: TextStyle(
                            fontSize: 17, color: Colors.black54
                        ), overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        width: 2,
                        color: Colors.orange,
                      ),
                      boxShadow: [ BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )]), child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/eren.jpg', ),
                ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width*0.65,
                  padding: EdgeInsets.only(left:20,),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Eren Yeager ', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),),],
                      ),
                      SizedBox(height: 5,),
                      Container(

                        alignment: Alignment.topLeft,
                        child: Text(
                          'You are not Soldiers, you are not warriors. you are just Murderers. ', style: TextStyle(
                            fontSize: 17, color: Colors.black54
                        ), overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
