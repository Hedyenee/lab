import 'package:flutter/material.dart';

class vente extends StatelessWidget {
  const vente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('vente'),
      ),
      body: SingleChildScrollView(
        child:
        Column(
            children: [
        Container(
        margin:EdgeInsets.only(top: 40,left: 20,right: 20),
        height: 200,
        width: 500,


        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Colors.blue, // Set border color
                width: 3.0),   // Set border width
            borderRadius: BorderRadius.all(
                Radius.circular(30.0)), // Set rounded corner radius
            boxShadow: [BoxShadow(blurRadius: 10,color: Colors.blue,offset: Offset(1,3))] // Make rounded corner of border
        ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('vitesse de vente :',
                style: TextStyle(fontSize:30,color:Colors.black),
              ),
              Text('data',
                style: TextStyle(fontSize:30,color:Colors.black),
              ),
              Text("m/s",
                style: TextStyle(fontSize:30,color:Colors.black),
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
