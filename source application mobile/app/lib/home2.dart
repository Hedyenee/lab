
import 'package:flutter/material.dart';

import 'home.dart';

class home2 extends StatelessWidget {
  const home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        child:

      Column(
      children:[
        Column(

          children:[
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color:Theme.of(context).primaryColor,
                  borderRadius:const BorderRadius.only(
                    bottomRight: Radius.circular(50),


                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                      title: Text('choose your services ', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white
                      )),

                      trailing: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/service.png"),

                      ),
                    ),
                    const SizedBox(height: 30)

                  ],
                ),
              ),
            Container(
              width: 250,
              height: 250,
              color: Colors.red,
              margin: EdgeInsets.only(top: 60),
              child: Image.asset("assets/images/service.png"),

            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  home()),
                );



              },

              child: Text('contrlle pv'),

            ),
            Container(
              width: 250,
              height: 250,
              color: Colors.red,
              margin: EdgeInsets.only(top: 60),
              child: Image.asset("assets/images/service.png"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const home2()),
                );



              },

              child: Text('contrlle pv'),


            )



          ],






      )
    ],
      ),






      ),
    );

  }
}
