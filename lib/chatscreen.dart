import 'package:chatapp/userdata.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  final User user;
  const Chatscreen({super.key, required this.user});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.profileNetworkUrl),
                  radius: 20,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.userName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Information',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(child: Text('Item 1')),
                PopupMenuItem(child: Text('Item 2')),
                PopupMenuItem(child: Text('Item 3')),
              ],
            ),
          ),
          Expanded(child: Text('message area')),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  margin: EdgeInsets.all(10),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Typa a message'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  child: Icon(Icons.send),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
