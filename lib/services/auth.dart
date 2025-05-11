import 'package:einventorycomputer/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

   // Create user obj based on Firebase User
  MyUser? _userFormFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(_userFormFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {

    try {
    UserCredential result = await _auth.signInAnonymously();
    User? user = result.user;
    return _userFormFirebaseUser(user!);
  } catch (e) {
    print(e.toString());
    return null;
  }
  }

  // sign is with email & password

  // register with email & password

  // sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}