import 'package:flutter/material.dart';
import 'login_register.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot)
        {
            //user connected
          if(snapshot.hasData)
          {
            return HomePage();
          }
          else //user not connected
            {
            return LoginRegister( );
          }
          },
      ),
    );
  }
}
