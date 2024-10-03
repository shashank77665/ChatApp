import 'package:chatapp/chatscreen.dart';
import 'package:chatapp/userdata.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Chat App',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.new_label,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.qr_code,
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(child: Text('Item 1')),
                    PopupMenuItem(child: Text('Item 2')),
                    PopupMenuItem(child: Text('Item 3')),
                    PopupMenuItem(child: Text('Item 4')),
                  ],
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: SearchAnchor(
            builder: (context, controller) {
              return SearchBar(
                controller: controller,
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: Icon(Icons.search),
              );
            },
            suggestionsBuilder: (context, controller) {
              return List.empty();
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: User.getDummyUsers().length,
            itemBuilder: (context, index) {
              final user = User.getDummyUsers()[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.profileNetworkUrl),
                ),
                title: Text(user.userName),
                subtitle: Text(user.lastMessage),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Chatscreen(
                          user: user,
                        ),
                      ));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
