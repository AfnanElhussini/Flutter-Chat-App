import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/screens/chats_Screen.dart';
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
      body: ModalProgressHUD(
       inAsyncCall: showSpiner,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(

            child: Container(
              child: Expanded(
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
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  controller: _emailcontroller,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your Email',
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
                                     return 'Please Fill Email Input';
                                    }
                                  },
                                ),
                              ),
                            ),
                         SizedBox(
                          height: 15,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: _passwordcontroller,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your Password',
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    prefixIcon: Icon(Icons.lock),),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Please Fill Password Input';}
                                  },
                                  obscureText: true,
                                ),
                              ),
                            ),
                    SizedBox(height: 25,),
                            ElevatedButton(

                              style: ElevatedButton.styleFrom(onSurface: Colors.orange),
                              onPressed: () async {
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
                                }
                              },
                              child: Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
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
}
