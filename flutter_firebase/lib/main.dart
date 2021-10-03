import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/chat_screen.dart';
import 'package:flutter_firebase/screens/chats_Screen.dart';
import 'package:flutter_firebase/screens/login.dart';
import 'package:flutter_firebase/screens/register_screen.dart';
import 'package:flutter_firebase/screens/welcomescreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),

      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context)=> WelcomeScreen(),
        Login.id: (context)=> Login(),
        Register.id: (context) => Register(),
        Chats.id: (context)=> Chats(),
        ChatScreen.id: (context)=> ChatScreen(),

      },
    );
  }
}

