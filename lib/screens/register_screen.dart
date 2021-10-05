import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/Widgets/TextField.dart';
import 'package:flutter_firebase/Widgets/button.dart';
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

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ModalProgressHUD(
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
                    child: textField(
                     controller: _email,
                      context: context,
                      hintText:'Enter Your Email' ,
                      email: true,
                      warningMessage: 'Email is Required',
                    )
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textField(
                        obscure: true,
                        controller: _password,
                        hintText: 'Password',
                        warningMessage: 'Not Valid',
                        context: context

                  ),),

                  SizedBox(height: 20),
                  ElvatedButton(
                    function: ()async{
                 setState(() {
                   showSpinner=true;
                 });
                 final newUser =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
              Navigator.pushNamed(context, Login.id);
              setState(() {
                showSpinner=false;
              });
              },
                    text: 'Register',
                    isText:true
              ),
                ],
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
