
import 'dart:math';

import 'package:app/mesure.dart';
import 'package:app/table_bat.dart';
import 'package:app/table_eol.dart';
import 'package:app/table_inpond.dart';
import 'package:app/table_outond.dart';
import 'package:app/table_pv.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'home.dart';

class pv extends StatefulWidget {
  const pv({super.key});

  @override
  State<pv> createState() => _pvState();
}
class _pvState extends State<pv>{
  final databaseReference = FirebaseDatabase.instance.ref();
   double ipv=0;
   double ppv=0;

  double ieol=0;
  double peol=0;

  double ibatt=0;
  double pbatt=0;

  double iinpond=0;
  double pinpond=0;

  double ioutond=0;
  double poutond=0;

  @override
  void initState() {
    super.initState();

    // Listen for changes to the database
    databaseReference.child('AS2E/BOX1').onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        setState(() {
          ipv = data['ipv']?.toDouble() ?? 0.0;
          ppv = data['ppv']?.toDouble() ?? 0.0;

          ieol = data['ieol']?.toDouble() ?? 0.0;
          peol = data['peol']?.toDouble() ?? 0.0;

          ibatt = data['ibatt']?.toDouble() ?? 0.0;
          pbatt = data['pbatt']?.toDouble() ?? 0.0;

          iinpond = data['iinpond']?.toDouble() ?? 0.0;
          pinpond = data['pinpond']?.toDouble() ?? 0.0;

          ioutond= data['ioutond']?.toDouble() ?? 0.0;
          poutond = data['poutond']?.toDouble() ?? 0.0;



        });
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title:Center(
          child:
        Text('visualisation des grandeurs',style: TextStyle(fontSize: 20),),
      ),
      ),


      body: SingleChildScrollView(
       child:
      Column(
        children: [
          Row(
            children: [

              Container(
                height: 860,
                child:Column(
                  children: [
                    Container(
                      width: 170,
                      height: 200,
                      margin: EdgeInsets.only(top: 60,left: 20),

                      child: Material(
                        elevation: 8,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.orange,
                        child:
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => tablePv())
                            );
                          },
                          child:
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child:
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children:[
                              Ink.image(
                                image:AssetImage("assets/images/pv4.jpeg"),
                                height: 130,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'I = $ipv A',
                                textAlign:TextAlign.center,
                                style: TextStyle(fontSize:20,color:Colors.black),
                              ),
                              Text(
                                'p = $ppv W',
                                textAlign:TextAlign.center,
                                style: TextStyle(fontSize:18,color:Colors.black),
                              ),
                              SizedBox(height: 6),
                            ],
                          ),

                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 170,
                      height: 250,
                      margin: EdgeInsets.only(top: 60,left: 20),

                      child: Material(
                        elevation: 8,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.orange,
                        child:
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  tableIN())
                            );
                          },
                          child:Container(
                            margin: EdgeInsets.only(top: 5),
                            child:


                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children:[
                              Ink.image(
                                image:AssetImage("assets/images/ond.png"),
                                height: 150,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'entré ',
                                textAlign:TextAlign.center,
                                style: TextStyle(fontSize:20,color:Colors.blue),
                              ),
                              Text(
                                'I = $iinpond A',
                                textAlign:TextAlign.center,
                                style: TextStyle(fontSize:20,color:Colors.black),
                              ),
                              Text(
                                'p = $pinpond W',
                                textAlign:TextAlign.center,
                                style: TextStyle(fontSize:20,color:Colors.black),
                              ),
                              SizedBox(height: 6),
                            ],
                          ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 170,
                      height: 200,
                      margin: EdgeInsets.only(top: 60,left: 20),

                      child: Material(
                        elevation: 8,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.orange,
                        child:
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  tableBatt())
                            );
                          },

                          child:Column(
                            mainAxisSize: MainAxisSize.min,
                            children:[
                              Ink.image(
                                image:AssetImage("assets/images/bat2.jpg"),
                                height: 130,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'I = $ibatt A',
                                textAlign:TextAlign.center,
                                style: TextStyle(fontSize:20,color:Colors.black),
                              ),
                              Text(
                                'p = $pbatt W',
                                textAlign:TextAlign.center,
                                style: TextStyle(fontSize:20,color:Colors.black),
                              ),
                              SizedBox(height: 6),
                            ],

                          ),
                        ),
                      ),
                    ),




                  ],
                ) ,
              ),

              Container(
                height: 860,
                child:Column(
                  children: [
                    Container(
                      width: 170,
                      height: 200,
                      margin: EdgeInsets.only(top: 60,left: 20),

                      child: Material(
                        elevation: 8,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.orange,
                        child:
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  tableEOL())
                            );
                          },
                          child:Container(
                            margin: EdgeInsets.only(top: 5),
                            child:

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children:[
                              Ink.image(
                                image:AssetImage("assets/images/eol2.jpg"),
                                height: 130,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'I = $ieol A',
                                textAlign:TextAlign.center,
                                style: TextStyle(fontSize:20,color:Colors.black),
                              ),
                              Text(
                                'p = $peol W',
                                textAlign:TextAlign.center,
                                style: TextStyle(fontSize:20,color:Colors.black),
                              ),
                              SizedBox(height: 6),
                            ],
                          ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 170,
                      height: 250,
                      margin: EdgeInsets.only(top: 60,left: 20),

                      child: Material(
                        elevation: 8,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.orange,
                        child:
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  tableOut())
                            );
                          },
                          child:
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child:

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children:[
                              Ink.image(
                                image:AssetImage("assets/images/ond.png"),
                                height: 150,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'sortie',
                                textAlign:TextAlign.center,
                                style: TextStyle(fontSize:20,color:Colors.blue),
                              ),

                              Text(
                                'I = $ioutond A',
                                textAlign:TextAlign.center,
                                style: TextStyle(fontSize:20,color:Colors.black),
                              ),
                              Text(
                                'p = $poutond W',
                                textAlign:TextAlign.center,
                                style: TextStyle(fontSize:20,color:Colors.black),
                              ),
                              SizedBox(height: 6),
                            ],
                          ),
                          ),
                        ),
                      ),
                    ),



                  ],
                ) ,
              ),
            ],

          ),
        ],

      ),
      ),
    );
  }
}

