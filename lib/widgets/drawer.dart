import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newtest/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            const DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountEmail: Text('asdasd@gmail.com'),
                  accountName: Text('Steven Hawk'),
                  currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(''),),
                ),
            ),
            const ListTile(
              leading:  Icon(Icons.home),
              title:  Text('Home',textScaleFactor: 1.2,),
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('Email',textScaleFactor: 1.2,),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.loginroute);
              },
              leading: const Icon(Icons.logout),
              title: const Text('Logout',textScaleFactor: 1.2,),
            ),
          ],
        ),
      ),
    );
  }
}
