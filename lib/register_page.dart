import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'my_textfield.dart';
import 'my_button.dart';
import 'squarebutton.dart';
import 'auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
//controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //methode to make a user
  void signUserUp() async {
    try {
      if(passwordController.text==confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      }
      else
        {
          showErrorMessage("Le mot de passe n\'est pas le mê me");
        }
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.green,
            title: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // éviter le débordement souvent provoqué par le clavier
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.lock,
                  size: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Créer un compte',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Email
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscuredText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                //mot de passe
                MyTextField(
                  controller: passwordController,
                  hintText: 'Mot de passe',
                  obscuredText: true,
                ),
                SizedBox(
                  height: 10,
                ),
            //Confirmer mot de passe
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confimer mot de passe',
                  obscuredText: true,
                ),

                SizedBox(
                  height: 25,
                ),
                MyButton(
                  onTap: signUserUp,
                  text: 'Valider',
                ),
                SizedBox(
                  height: 25,
                ),
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Ou se connecter avec',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google
                    SquareTile(onTap: ()=>AuthService().signInWithGoogle(),
                        imagePath: 'images/google.png'),
                    SizedBox(
                      width: 25,
                    ),
                    SquareTile(onTap: () =>AuthService().signInWithGoogle(),
                        imagePath: 'images/apple.png'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Déja enregistré ?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Se connecter',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//test
