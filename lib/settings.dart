import 'package:chatapp/methods.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          logOut(context);
        },
        style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(const Color.fromARGB(255, 3, 56, 100)),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50))),
        child: Text(
          'Log Out',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
