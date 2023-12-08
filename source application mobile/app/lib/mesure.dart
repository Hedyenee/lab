
import 'package:flutter/material.dart';


class mesure extends StatelessWidget {
  const mesure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Les grandeurs physiques'),
      ),
      body:SingleChildScrollView(
        child:
          Column(
            children: [
              Container(
                margin:EdgeInsets.only(top: 40,left: 20,right: 20),
                height: 250,
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
                child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 200,
                          //color: Colors.tealAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Text('Tension :',
                                      style: TextStyle(fontSize:30,color:Colors.black),
                                  ),
                                  Text('Courant :',
                                      style: TextStyle(fontSize:30,color:Colors.black),
                                  ),
                                  Text('Puissance :',
                                      style: TextStyle(fontSize:30,color:Colors.black),
                                  ),
                                ],
                          ),
                        ),
                        Container(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('data',
                                      style: TextStyle(fontSize:30,color:Colors.black),),
                              Text('data',
                                  style: TextStyle(fontSize:30,color:Colors.black),
                              ),
                              Text('data',
                                style: TextStyle(fontSize:30,color:Colors.black),

                              ),
                            ],

                          ),
                        ),
                        Container(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('v',
                                style: TextStyle(fontSize:30,color:Colors.black),

                              ),
                              Text('A',
                                  style: TextStyle(fontSize:30,color:Colors.black),

                              ),
                              Text('W',
                                style: TextStyle(fontSize:30,color:Colors.black),

                              ),
                            ],

                          ),

                        ),
                      ],


                  ),












              ),

              Container(
                margin:EdgeInsets.only(top: 40,left: 20,right: 20),
                height: 250,
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


              ),


              Container(
                margin:EdgeInsets.only(top: 40,left: 20,right: 20),
                height: 250,
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


              ),


              Container(
                margin:EdgeInsets.only(top: 40,left: 20,right: 20),
                height: 250,
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


              ),

              Container(
                width: 250,
                height: 30,
              )



            ],

          ),
      ),









    );
  }
}
