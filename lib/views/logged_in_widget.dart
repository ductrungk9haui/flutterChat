import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/services/database.dart';
import 'package:flutter_app1/services/google_sign_in.dart';
import 'package:flutter_app1/views/chatrooms.dart';
import 'package:flutter_app1/views/search.dart';
import 'package:flutter_app1/widgets/widget.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    DatabaseMethods databaseMethods = new DatabaseMethods();
    return FutureBuilder(
      future: databaseMethods.doesUserAlreadyExist(user.email),
      builder: (context, AsyncSnapshot<bool> result) {
        if (result.hasData && !result.data) databaseMethods.addUserInfo(user);
        return Scaffold(
          appBar: appBarMain(context),
          body: Container(
            alignment: Alignment.topLeft,
            color: Colors.blueGrey.shade900,
            child: Column(
              children: [
                Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  CircleAvatar(
                    maxRadius: 25,
                    backgroundImage: NetworkImage(user.photoURL),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Column(
                        children: [
                          Text(
                            'Name: ' + user.displayName,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.left
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Email: ' + user.email,
                            style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.left
                          )
                        ]),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(right: 1),
                    child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              final provider = Provider.of<GoogleSignInProvider>(context,
                                  listen: false);
                              provider.logout();
                            },
                            child: Text('Logout'),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Search()));
                            },
                            child: Text('Search'),
                          )
                        ]),
                  ),
                ],
              ),
                ChatRoom()
            ]),

          ),
        );
      },
    );
  }
}
