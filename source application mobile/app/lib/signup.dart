import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/sigin.dart';
import 'home.dart';
import 'package:fluttertoast/fluttertoast.dart';

class signup extends StatefulWidget {
  static const screenRoute='sigup';
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _emailController=TextEditingController();
  final _passwordcontroller=TextEditingController();
  final _confirmpasswordcontroller=TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
  }
  Future SignUp() async {
    if (passwordconfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordcontroller.text.trim());

      Fluttertoast.showToast(
          msg: "Création du compte avec succés",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );


      Navigator.of(context).pushReplacementNamed(home.screenRoute);
    }
  }
  bool passwordconfirmed(){
    if (_passwordcontroller.text.trim()==_confirmpasswordcontroller.text.trim()){
      return true;
    }else{
      return false;
    }
  }
  void go(){
    Navigator.of(context).pushReplacementNamed(login.screenRoute);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('assets/images/login.png')),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com',
                  ),
                ),
              ),
              //password
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'mot de passe ',
                      hintText: 'Entrez le mot de passe sécurisé'),
                ),
              ),
              SizedBox(height: 20,),
              //confirm password
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _confirmpasswordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirmez le mot de passe',
                      hintText: 'Confirmez le mot de passe'),
                ),
              ),
              SizedBox(height: 20,),
              /*Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              SizedBox(height: 20,),*/

              GestureDetector(
                onTap: SignUp,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 65,
                    width: 200,
                    padding:EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.cyan, borderRadius: BorderRadius.circular(20)),
                    child: Center (child:
                    Text(
                      's`inscrire',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 130,
              ),
              GestureDetector(
                  onTap: go,
                  child: Text('Déjà membre ? Se connecter ici',style: TextStyle(
                      color: Colors.indigo,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.indigo,
                      decorationThickness:2.0
                  ),
              ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}


