import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/screens/login.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class Register extends StatefulWidget {
  static const String id= 'register_screen';
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth= FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                Container(
                  height: 180,
                  child: Center(child: Image(image: AssetImage('assets/r2.png'))),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,

                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email= value;
                    },
                    decoration: InputDecoration(

                      hintText: 'Enter your Email',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(

                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),

                      prefixIcon: Icon(Icons.email),
                      ),
                    ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password= value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your Password',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: ()async{
               setState(() {
                 showSpinner=true;
               });
               final newUser =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
            Navigator.pushNamed(context, Login.id);
            setState(() {
              showSpinner=false;
            });
            },

 style: ElevatedButton.styleFrom(onSurface: Colors.orange, ),
              child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
            ),

              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
