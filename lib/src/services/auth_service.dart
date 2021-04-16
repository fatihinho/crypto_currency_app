import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// Mail & Password
Future<bool> signIn(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final User? user = userCredential.user;
    if (user != null) {
      return true;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  return false;
}

Future<bool> signUp(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final User? user = userCredential.user;
    if (user != null) {
      return true;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool> signInAnonymous() async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    final User? user = userCredential.user;
    if (user != null) {
      return true;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

bool hasCurrentUser() {
  if (_auth.currentUser != null) {
    return true;
  } else {
    return false;
  }
}

String getUID() => _auth.currentUser!.uid;

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
