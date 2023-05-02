import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService
{
  //Google sign in
  signInWithGoogle() async
  {
    //commencer le procesus de sign in
    final GoogleSignInAccount? gUser=await GoogleSignIn().signIn();
    //obternir les infos detaillees de la requete
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //creer les credits de l'usager
    final credential=GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    //tester
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}