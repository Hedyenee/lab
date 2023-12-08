
import 'package:app/pv.dart';
import 'package:app/sigin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'test.dart';
import 'package:app/all.dart';
class home extends StatefulWidget {
  home({Key? key}) : super(key: key);
  static const screenRoute='/home';

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final user = FirebaseAuth.instance.currentUser!;
  void out(){
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed(login.screenRoute);
  }

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 10,
        title: Center(
          child: Text("Choisir votre service",

          ),
        ),
        leading:Container(
          padding: EdgeInsets.all(5),
          child:Image.asset("assets/images/as2e.png",
        ),
      ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_horiz),
            itemBuilder:(context) =>[
              PopupMenuItem(
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(user.email!),
                    )
                  ],
                ),
              ),

              PopupMenuItem(
                value: 'op2',
                child: Row(
                  children: [
                    const Icon(
                      Icons.display_settings,
                      color: Colors.black,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Affichage globale"),


                    )
                  ],
                ),
              ),

              PopupMenuItem(
                value: 'op1',
                child: Row(
                  children: [
                    const Icon(
                      Icons.subdirectory_arrow_left,
                      color: Colors.black,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Se déconnecter"),


                    )
                  ],
                ),
              ),

            ],
            onSelected:(value){
              if(value=='op1'){
                Navigator.of(context).pushReplacementNamed(login.screenRoute);
              }

              if(value=='op2'){
                Navigator.of(context).pushReplacementNamed(all.screenRoute);
              }
            }

          ),
        ],


      ),

      body:Center(
        child: Column(
          children: [
            SingleChildScrollView(
              child:

                  Column(

                    children:[

                      Container(

                        width: 250,
                        height: 250,
                        margin: EdgeInsets.only(top: 60),

                        child: Material(
                          elevation: 8,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                          shadowColor: Colors.orange,
                          child:
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const pv())
                            );
                          },
                          child:
                          Container(
                            margin: EdgeInsets.only(top:10),
                            child:
                          Column(
                          mainAxisSize: MainAxisSize.min,

                          children:[
                          Ink.image(
                            image:AssetImage("assets/images/AND.jpg"),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),

                            SizedBox(height: 6),

                            Container(
                              margin: EdgeInsets.only(top:10),
                              child:
                             Text(
                              'Visualisation des grandeurs physiques ',
                              textAlign:TextAlign.center,
                              style: TextStyle(fontSize:19,color:Colors.black),
                            ),
                            ),
                            SizedBox(height: 6),
                        ],
                          ),
                      ),
                        ),
                        ),
                      ),

                      Container(
                        width: 250,
                        height: 250,
                        margin: EdgeInsets.only(top: 60),

                        child: Material(
                          elevation: 8,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                          shadowColor: Colors.orange,
                          child:
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => test())
                              );
                            },
                            child:
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child:

                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children:[

                                Ink.image(
                                  image:AssetImage("assets/images/box.png"),
                                  height: 150,
                                  width: 150,

                                  fit: BoxFit.cover,
                                ),


                                SizedBox(height: 10),

                                 Text(
                                  'Visualisation des données météorologiques  ',
                                  style: TextStyle(fontSize:19,color:Colors.black),
                                   textAlign:TextAlign.center,
                                ),


                                SizedBox(height: 6),

                              ],
                            ),

                            ),
                          ),
                        ),
                      ),

                   Container(
                width: 250,
                height: 30,
                margin: EdgeInsets.only(top: 60),


                   ),



                    ],






                  )
              ),
          ],
        ),
      ),






   //   ),
    );
  }
}
