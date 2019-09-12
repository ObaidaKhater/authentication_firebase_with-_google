import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthintication{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser>signIn(String email , String password)async{
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email ,password: password);
    return user;
  }


 Future<FirebaseUser> register(String email , String password)async{
   FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return user;
  }


  signOut()async{
    await _firebaseAuth.signOut();
  }

  Future<FirebaseUser> currentUser()async{
  FirebaseUser user = await _firebaseAuth.currentUser();
  print(user);
  return user;
  }

  Future<FirebaseUser>signInWithGoogle()async{
    GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleAccount.authentication;
    FirebaseUser user = await _firebaseAuth.signInWithGoogle(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    return user;
  }


}











