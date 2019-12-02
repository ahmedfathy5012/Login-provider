import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../repositories/user_repository.dart';

class UserInfoPage extends StatelessWidget {
  FirebaseUser user;
  UserInfoPage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USer Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(user.email),
            RaisedButton(
              child: Text('Sign Out'),
              onPressed: (){
                Provider.of<UserRepository>(context).signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}