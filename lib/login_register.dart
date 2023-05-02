import 'package:flutter/material.dart';
import 'package:flutteremailpasse/register_page.dart';
import 'login_page.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {

  bool showLoginPage=true;

  void togglePages()
  {
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }

 @override
 Widget build(BuildContext context){
    if(showLoginPage)
      {
        return LoginPage(
            onTap: togglePages,
        );
      }
    else
      {
        return RegisterPage(
          onTap: togglePages,
        );
      }
 }
}
