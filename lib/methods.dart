import 'package:firebase_auth/firebase_auth.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    // The user returned from createUserWithEmailAndPassword is nullable
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print("Account Created Successfully");
      return user; // Return the user object if creation is successful
    } else {
      print('Account creation failed');
      return null; // Return null if no user object is returned
    }
  } catch (e) {
    print(e);
    return null; // Catch any errors and return null
  } finally {
    print('Create account function executed');
  }
}
