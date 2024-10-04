import 'package:flutter/material.dart';

class Chatscreen extends StatelessWidget {
  final Map<String, dynamic> userMap;
  final chatRoomId;
  const Chatscreen({required this.chatRoomId, required this.userMap});

  @override
  Widget build(BuildContext context) {
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
            title: Text(userMap['name']),
            subtitle: Text(userMap['email']),
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
