import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/Widgets/TextField.dart';
import 'package:flutter_firebase/Widgets/button.dart';
import 'package:flutter_firebase/screens/chats_Screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  static const String id='login';
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpiner=false;
  void initState(){
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  @override

  void dispose()
  {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ModalProgressHUD(
         inAsyncCall: showSpiner,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SingleChildScrollView(

              child: Container(
                height: MediaQuery.of(context).size.height-100,
                width: MediaQuery.of(context).size.width,
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                    const SizedBox(height: 50,),
                    Container(

                      height: 250, child: Image(image: AssetImage('assets/login1.png'), fit: BoxFit.contain,),

                    ),
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: textField(
                                  controller: _emailcontroller,
                                  hintText: 'Enter your Email',
                                  email:true,
                                  context:context,
                                  warningMessage: 'Email is Required',
                                ),
                              ),
                            ),
                         SizedBox(
                          height: 15,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: textField(
                                  obscure: true,
                                  controller: _passwordcontroller,
                                  hintText: 'Password',
                                  warningMessage: 'Not Valid',
                                  context: context
                                ),
                              ),
                            ),
                    SizedBox(height: 25,),
                            ElvatedButton(
                              function: () async {
                                if(_formKey.currentState!.validate()){
                                  setState(() {
                                    showSpiner=true;
                                  });
                                  var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
                                  if(result != null){
                                    Navigator.pushNamed(context, Chats.id);
                                    setState(() {
                                      showSpiner=false;
                                    });
                                  }else{
                                    print('user not found');
                                  }
                                }else{
                                  print('error');
                                }
                              },
                              text: 'LOGIN',
                              isText: true
                              ),
                          ],
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  // void showToastN(){
  //   FToast.showToast(
  //       child: Container(
  //
  //       )
  //   );
  // }
}
