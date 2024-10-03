import 'package:chatapp/forgotpass.dart';
import 'package:chatapp/login.dart';
import 'package:chatapp/methods.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // String name = "", email = "", password = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  bool isLoading = false;

  final _formkey = GlobalKey<FormState>();

  // registration() async {
  //   if (password != null &&
  //       namecontroller.text != "" &&
  //       emailcontroller.text != "") {
  //     try {
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(email: email, password: password);
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Text(
  //         "Registered Sucessfully",
  //         style: TextStyle(fontSize: 20),
  //       )));
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => Home(),
  //           ));
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'weak-password') {
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //             backgroundColor: Colors.orangeAccent,
  //             content: Text(
  //               "Password Provided is too Weak",
  //               style: TextStyle(fontSize: 18.0),
  //             )));
  //       } else if (e.code == "email-already-in-use") {
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //             backgroundColor: Colors.orangeAccent,
  //             content: Text(
  //               "Account Already exists",
  //               style: TextStyle(fontSize: 18.0),
  //             )));
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'images/car.png',
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 10),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          controller: namecontroller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'Name'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            }
                            return null;
                          },
                          controller: emailcontroller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'Email'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'Password'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            if (namecontroller.text.isNotEmpty &&
                                emailcontroller.text.isNotEmpty &&
                                passwordcontroller.text.isNotEmpty) {
                              setState(() {
                                isLoading = true;
                              });

                              createAccount(
                                      namecontroller.text,
                                      emailcontroller.text,
                                      passwordcontroller.text)
                                  .then((user) {
                                if (user != null) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  print('Signup Sucessfull');
                                } else {
                                  print('Login Failed');
                                }
                              });
                            } else {
                              print('Please Enter fields');
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  const Color.fromARGB(255, 3, 56, 100)),
                              minimumSize: WidgetStatePropertyAll(
                                  Size(double.infinity, 50))),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                ));
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'or Login with',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 15, 34, 49),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/google.png',
                          height: 40,
                        ),
                        Image.asset(
                          'images/apple.png',
                          height: 60,
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
    );
  }
}
