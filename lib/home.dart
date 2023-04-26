import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        actions: [
        IconButton(
        onPressed: () {},
    icon: Icon(Icons.logout),
    )
    ],
    ),
    body: Center(
    child: Text('Connecté'),
    ),
    );
  }
}
