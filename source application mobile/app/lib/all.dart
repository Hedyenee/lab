
import 'package:app/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';



class all extends StatefulWidget {
  static const screenRoute='/all';
  const all({Key? key}) : super(key: key);

  @override
  State<all> createState() => _allState();
}

class _allState extends State<all> {
  final databaseReference = FirebaseDatabase.instance.ref();
  double temp = 0.0;
  double hum = 0.0;
  double vent = 0.0;
  double lum = 0.0;

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
  void initState() {
    super.initState();

    // Listen for changes to the database
    databaseReference.child('AS2E/BOX2').onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        setState(() {
          temp = data['temp']?.toDouble() ?? 0.0;
          hum = data['hum']?.toDouble() ?? 0.0;
          vent = data['vent']?.toDouble() ?? 0.0;
          lum = data['lum']?.toDouble() ?? 0.0;
        });
      }
    });
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
        title: Text('les valeurs en temps réel'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(home.screenRoute);
          },),
      ),



      body: SingleChildScrollView(
          child: Column(
            children: [
                  Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.orange, // Set border color
                            width: 3.0),   // Set border width
                        borderRadius: BorderRadius.all(
                            Radius.circular(30.0)), // Set rounded corner radius
                        boxShadow: [BoxShadow(blurRadius: 10,color: Colors.orange,offset: Offset(1,3))] // Make rounded corner of border
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin:EdgeInsets.only(top: 10,left: 10),
                          child: Image.asset("assets/images/pv4.jpeg",
                            height: 150,
                            width: 150,

                          ),

                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:50,left: 10),
                              child: Column(
                                children: [
                                  Text("I = $ipv A",style: TextStyle(fontSize: 20),),
                                  Text(""),
                                  Text("P= $ppv W",style: TextStyle(fontSize: 18),),
                                ],


                              ),

                            ),

                          ],

                        ),
                      ],
                    ),

                  ),

              Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.orange, // Set border color
                        width: 3.0),   // Set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0)), // Set rounded corner radius
                    boxShadow: [BoxShadow(blurRadius: 10,color: Colors.orange,offset: Offset(1,3))] // Make rounded corner of border
                ),

                child: Row(
                  children: [
                    Container(
                      margin:EdgeInsets.only(top: 10,left: 10),
                      child: Image.asset("assets/images/eol2.jpg",
                        height: 150,
                        width: 150,


                      ),

                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:50,left: 30),
                          child: Column(
                            children: [
                              Text("I = $ieol A",style: TextStyle(fontSize: 20),),
                              Text(""),
                              Text("P= $peol W",style: TextStyle(fontSize: 20),),
                            ],


                          ),

                        ),

                      ],

                    ),
                  ],
                ),

              ),

              Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.orange, // Set border color
                        width: 3.0),   // Set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0)), // Set rounded corner radius
                    boxShadow: [BoxShadow(blurRadius: 10,color: Colors.orange,offset: Offset(1,3))] // Make rounded corner of border
                ),
                child: Row(
                  children: [
                    Container(
                      margin:EdgeInsets.only(top: 10,left: 10),
                      child: Image.asset("assets/images/ond.png",
                        height: 150,
                        width: 150,

                      ),

                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:50,left: 30),
                          child: Column(
                            children: [
                              Text("entré d'onduleur :"),
                              Text(""),
                              Text("I = $iinpond A",style: TextStyle(fontSize: 20),),
                              Text(""),
                              Text("P= $pinpond W",style: TextStyle(fontSize: 20),),
                            ],


                          ),

                        ),

                      ],

                    ),
                  ],
                ),

              ),

              Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.orange, // Set border color
                        width: 3.0),   // Set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0)), // Set rounded corner radius
                    boxShadow: [BoxShadow(blurRadius: 10,color: Colors.orange,offset: Offset(1,3))] // Make rounded corner of border
                ),
                child: Row(
                  children: [
                    Container(
                      margin:EdgeInsets.only(top: 10,left: 10),
                      child: Image.asset("assets/images/ond.png",
                        height: 150,
                        width: 150,

                      ),

                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50,left: 30),
                          child: Column(
                            children: [
                              Text("sortie d'onduleur :"),
                              Text(""),
                              Text("I = $ioutond A",style: TextStyle(fontSize: 20),),
                              Text(""),
                              Text("P= $poutond W",style: TextStyle(fontSize: 20),),
                            ],


                          ),

                        ),

                      ],

                    ),
                  ],
                ),

              ),

              Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.orange, // Set border color
                        width: 3.0),   // Set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0)), // Set rounded corner radius
                    boxShadow: [BoxShadow(blurRadius: 10,color: Colors.orange,offset: Offset(1,3))] // Make rounded corner of border
                ),
                child: Row(
                  children: [
                    Container(
                      margin:EdgeInsets.only(top: 10,left: 10),
                      child: Image.asset("assets/images/bat2.jpg",
                        height: 150,
                        width: 150,

                      ),

                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:50,left:30),
                          child: Column(
                            children: [
                              Text("I = $ibatt A",style: TextStyle(fontSize: 20),),
                              Text(""),
                              Text("P= $pbatt W",style: TextStyle(fontSize: 20),),
                            ],


                          ),

                        ),

                      ],

                    ),
                  ],
                ),

              ),

              Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.orange, // Set border color
                        width: 3.0),   // Set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0)), // Set rounded corner radius
                    boxShadow: [BoxShadow(blurRadius: 10,color: Colors.orange,offset: Offset(1,3))] // Make rounded corner of border
                ),
                child: Row(
                  children: [
                    Container(
                      margin:EdgeInsets.only(top: 10,left: 10),
                      child: Image.asset("assets/images/vent.png",
                        height: 150,
                        width: 150,

                      ),

                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50,left: 10),
                          child: Column(
                            children: [
                              Text("vitesse de vent : ",style: TextStyle(fontSize: 20),),
                              Text(""),
                              Text(" $vent m/s",style: TextStyle(fontSize: 20),),

                            ],


                          ),

                        ),

                      ],

                    ),
                  ],
                ),

              ),

              Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.orange, // Set border color
                        width: 3.0),   // Set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0)), // Set rounded corner radius
                    boxShadow: [BoxShadow(blurRadius: 10,color: Colors.orange,offset: Offset(1,3))] // Make rounded corner of border
                ),
                child: Row(
                  children: [
                    Container(
                      margin:EdgeInsets.only(top: 10,left: 10),
                      child: Image.asset("assets/images/lum.png",
                        height: 150,
                        width: 150,

                      ),

                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50,left:40 ),
                          child: Column(
                            children: [
                              Text("luminosité :",style: TextStyle(fontSize: 20),),
                              Text(""),
                              Text("$lum lux",style: TextStyle(fontSize: 20),),

                            ],


                          ),

                        ),

                      ],

                    ),
                  ],
                ),

              ),

              Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.orange, // Set border color
                        width: 3.0),   // Set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0)), // Set rounded corner radius
                    boxShadow: [BoxShadow(blurRadius: 10,color: Colors.orange,offset: Offset(1,3))] // Make rounded corner of border
                ),
                child: Row(
                  children: [
                    Container(
                      margin:EdgeInsets.only(top: 10,left: 20),
                      child: Image.asset("assets/images/hum.png",
                      ),

                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50,left: 20),
                          child: Column(
                            children: [
                              Text("température : $temp °C",style: TextStyle(fontSize: 19),
                              ),
                              Text(""),

                              Text("humidité  : $hum  %",style: TextStyle(fontSize: 19),
                              ),
                            ],


                          ),

                        ),

                      ],

                    ),
                  ],
                ),

              ),

            ],







          ),



    ),
    );
  }
}
