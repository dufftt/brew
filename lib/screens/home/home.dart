import 'package:flutter/material.dart';
import 'package:brew/screens/home/settings_form.dart';
import 'package:brew/services/auth.dart';
import 'package:brew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew/models/brew.dart';
import 'package:brew/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
          backgroundColor: Colors.green[40],
          appBar: AppBar(
            title: Text('Chai Wala'),
            backgroundColor: Colors.green[400],
            elevation: 0.0,
            actions: [
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
              FlatButton.icon(
                  onPressed: () => _showSettingsPanel(),
                  icon: Icon(Icons.settings),
                  label: Text('settings'))
            ],
          ),
          body:
              // Container(
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage('assets/coffee_bg.png'), fit: BoxFit.cover),
              //     ),
              //     child:
              BrewList()),
      //),
    );
  }
}
