import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'sigin.dart';


class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  Widget buildListTile(String title, IconData icon,Function()? onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: const Color.fromARGB(255, 0, 80, 146),
      ),
      title:
      Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapLink ,
    );
  }

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          color: const Color.fromARGB(255, 0, 80, 146),
          child:
          const Text(
            'Tour guide',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20,),
        buildListTile(
            'Sensors archive',
            Icons.archive_rounded,
                (){
            //  Navigator.of(context).pushReplacementNamed(ArchiveScreen.screenRoute);
            }
        ),
        buildListTile(
            'Filters',
            Icons.filter_list,
                (){
             // Navigator.of(context).pushReplacementNamed(Dashboard.screenRoute);
            }
        ),
        buildListTile(
            user.email!,
            Icons.person,
                () => null
        ),
        buildListTile(
            'Sign out',
            Icons.arrow_circle_left,
                () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed(login.screenRoute);
            }
        ),
      ]
      ),
    );
  }


}