import 'package:app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';


class login extends StatefulWidget {
  static const screenRoute='/page11';
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _emailController=TextEditingController();
  final _passwordcontroller=TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordcontroller.dispose();
  }
  Future Signin() async {

    try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordcontroller.text.trim());

    Fluttertoast.showToast(
        msg: "connexion avec succès",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 20.0

    );

    Navigator.of(context).pushReplacementNamed(home.screenRoute);}

    catch (error) {
    String errorMessage = "Une erreur s'est produite. Veuillez réessayer.";

    if (error is FirebaseAuthException) {
    if (error.code == 'user-not-found' ||
    error.code == 'wrong-password') {
    errorMessage = "Email ou mot de passe non valide.";
    }
    }

    Fluttertoast.showToast(
    msg: errorMessage,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 20.0,
    );
    }

  }
  void go(){
    Navigator.of(context).pushReplacementNamed(signup.screenRoute);
  }

  void handleSignIn() {
    final email = _emailController.text.trim();
    final password = _passwordcontroller.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: "Veuillez remplir tous les champs",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 20.0,
      );
    } else {
      Signin();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/log.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Row(
        children: [
            Container(

              padding: EdgeInsets.only(left: 10, top: 130),
              child: Text(
                'bienvenue',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),

            ),
            ]

            ),


            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height *0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(

                        children: [

                          TextField(

                            controller: _emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail, color: Color(0xff4c505b,)),
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter valid email id as abc@gmail.com',

                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: _passwordcontroller,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock_person,color: Color(0xff4c505b,)),
                                labelText: 'mot de passe ',
                                hintText: 'Entrez le mot de passe sécurisé'),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Se connecter ',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                  color: Colors.white,
                                  icon: Icon(
                                    Icons.arrow_forward,
                                  ),
                                  onPressed:handleSignIn,
                                ),
                              )

                            ],
                          )
                        ],
                      ),

                    )
                  ],

                ),
              ),
            )
          ],
        ),


      ),
    );

  }
}

