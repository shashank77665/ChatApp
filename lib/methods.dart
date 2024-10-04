import 'package:chatapp/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _forestore = FirebaseFirestore.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      // Set the display name immediately after account creation
      await user.updateDisplayName(name);
      await user.reload(); // Reload the user to fetch the updated information

      // Store user information in Firestore
      await _forestore.collection('users').doc(_auth.currentUser?.uid).set({
        "name": name,
        "email": email,
        "status": "Unavailable",
      });

      print("Account Created and Display Name Set Successfully");
      return user;
    } else {
      print('Account creation failed');
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  } finally {
    print('Create account function executed');
  }
}

// Future<User?> createAccount(String name, String email, String password) async {
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   FirebaseFirestore _forestore = FirebaseFirestore.instance;

//   try {
//     User? user = (await _auth.createUserWithEmailAndPassword(
//             email: email, password: password))
//         .user;

//     await _forestore.collection('users').doc(_auth.currentUser?.uid).set({
//       "name": name,
//       "email": email,
//       "status": "Unavailable",
//     });

//     if (user != null) {
//       print("Account Created Successfully");
//       return user;
//     } else {
//       print('Account creation failed');
//       return null;
//     }
//   } catch (e) {
//     print(e);
//     return null;
//   } finally {
//     print('Create account function executed');
//   }
// }

Future<User?> logIn(String email, String password) async {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = (await auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print('Login Sucessfull');
      return user;
    } else {
      print('Login Failed');
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      print('Logged out');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignIn(),
          ));
    });
  } catch (e) {
    print("error");
  }
}
