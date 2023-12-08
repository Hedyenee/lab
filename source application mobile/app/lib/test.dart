
import 'package:app/table_lum.dart';
import 'package:app/table_temp.dart';
import 'package:app/table_vent.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'lum.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test>{
  final databaseReference = FirebaseDatabase.instance.ref();

  double temp = 0.0;
  double hum = 0.0;

  double vent = 0.0;
  double lum = 0.0;

  @override
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,

        title: Center(
          child:

        Text('visualisation des données ', style: TextStyle(fontSize: 20),),
      ),
      ),

      body: SingleChildScrollView(
        child:


        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 170,
                  height: 230,
                  margin: EdgeInsets.only(top: 60, left: 20),


                  child: Material(
                    elevation: 8,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    shadowColor: Colors.orange,

                    child:
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (
                                context) => const tableVent())
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: AssetImage("assets/images/ventan.gif"),
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 6),
                          Text(
                            ' Vitesse de vent : ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Text(
                            ' $vent ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),

                          Text(
                            ' m/s ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(height: 6),
                        ],

                      ),
                    ),
                  ),
                ),


                Container(
                  width: 170,
                  height: 230,
                  margin: EdgeInsets.only(top: 60, left: 20),

                  child: Material(
                    elevation: 8,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    shadowColor: Colors.orange,
                    child:
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const tableLum())
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: AssetImage("assets/images/summer.gif"),
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Luminosité : ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Text(
                            ' $lum ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),

                          Text(
                            ' lux ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(height: 6),
                        ],

                      ),
                    ),
                  ),
                ),


              ],


            ),

            Container(
              width: 250,
              height: 230,
              margin: EdgeInsets.only(top: 60, left: 20),

              child: Material(
                elevation: 8,
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                shadowColor: Colors.orange,
                child:
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const tableTemp())
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image: AssetImage("assets/images/hum.png"),
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 6),

                      SizedBox(height: 6),
                      Text(
                        textAlign:TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        'Température: $temp °C',
                      ),
                      Text(
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        'Humidité:  $hum %',
                        textAlign:TextAlign.center,
                      ),



                    ],

                  ),
                ),
              ),

            ),


          ],


        ),

      ),
    );
  }}

