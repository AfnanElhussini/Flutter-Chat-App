import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/screens/chats_Screen.dart';
import 'package:flutter_firebase/screens/welcomescreen.dart';

import 'login.dart';
final _firestore= FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id= 'chat_screen';
  const ChatScreen({Key? key}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
final messageTextController= TextEditingController();

  final _auth = FirebaseAuth.instance;
  String? messageText;

  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){
    final user= _auth.currentUser;
    if( user != null){
      loggedInUser= user;
    print(loggedInUser.email);}
  }

  void messageStreams()async{
     await for( var snapshot in  _firestore.collection('messages').snapshots()){
for( var message in snapshot.docs){
  print(message.data());
}
      }
}
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(onPressed: (){
          Navigator.pop(context, Chats.id);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,),),
        title: Center(
          child: Row(
            children: [
              Image.asset('assets/chatt.png', height: 25,),

              Text(
                'ChatMe', style: TextStyle(color: Colors.white, ),),],),
        ),
        actions: [
          IconButton(onPressed: (){
           Navigator.pushNamed(context, WelcomeScreen.id);
            }, icon: Icon(Icons.close, color: Colors.white,),),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             MessagesStream(),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.orange,
                      width: 2,
                    )
                  )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
               messageText=value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20
                        ),
                        hintText: 'Enter your Message here..',
                        border: InputBorder.none,
                      ),
                    )),
                    TextButton(
                      onLongPress: (){
                        messageTextController.clear();
                      },
                      child: Text('send', style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),
                     onPressed: (){
            _firestore.collection('messages').add({
               'text': messageText,
               'sender': loggedInUser.email,
});
                     },
                    )
                  ],
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder:( context, AsyncSnapshot<QuerySnapshot> snapshot)
      {
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.orange,
            ),
          );
        }
        List<MessageBubble> messagesWidgets = snapshot.data!.docs.map((DocumentSnapshot e) {
          Map<String,dynamic> data = e.data()! as Map<String, dynamic>;
          return MessageBubble(sender: data['sender'],text: data['text'],isMe: loggedInUser == loggedInUser);
        }).toList();

        return Expanded(

          
          child: ListView(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 20.0
            ),
            children: messagesWidgets,
          ),
        );
      },
    );
  }
}


class MessageBubble extends StatelessWidget {
MessageBubble({this.sender, this.text , this.isMe});
final String? sender;
final String? text;
late final bool? isMe;

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe!?CrossAxisAlignment.end: CrossAxisAlignment.start ,
        children: [
          Text('$sender', style: TextStyle(
            fontSize: 13,
            color: Colors.black54,
          ),),
          Material(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
            elevation: 4.0,
            color: isMe! ? Colors.orange: Colors.white ,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text('$text', style: TextStyle(
                  fontSize: 25,
                color: isMe!? Colors.white: Colors.black54,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
