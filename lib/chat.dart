import 'package:chatapp/chatroom.dart';
import 'package:chatapp/chatscreen.dart';
import 'package:chatapp/methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    print('Search Started');
    setState(() {
      isLoading = true;
    });

    try {
      // Search for the user in the Firestore
      await _firestore
          .collection('users')
          .where("email", isEqualTo: _search.text)
          .get()
          .then((value) {
        print('Search complete');

        // Check if any documents are returned
        if (value.docs.isNotEmpty) {
          // If there are results, assign the data to userMap
          setState(() {
            userMap = value.docs[0].data();
            isLoading = false;
          });
          print(userMap);
        } else {
          // If no results, display a message or handle accordingly
          setState(() {
            isLoading = false;
          });
          print('No users found for the given email');
        }
      });
    } catch (e) {
      // Handle any errors that occur during the search
      print('Error occurred during search: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
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
              // Padding(
              //   padding: EdgeInsets.all(10),
              //   child: SearchAnchor(
              //     builder: (context, controller) {
              //       return SearchBar(
              //         controller: controller,
              //         onTap: () {
              //           controller.openView();
              //         },
              //         onChanged: (_) {
              //           controller.openView();
              //         },
              //         leading: Icon(Icons.search),
              //       );
              //     },
              //     suggestionsBuilder: (context, controller) {
              //       return List.empty();
              //     },
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                child: TextField(
                  controller: _search,
                  decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 15, bottom: 15),
                child: TextButton(
                  onPressed: () {
                    onSearch();
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(255, 3, 56, 100)),
                      minimumSize:
                          WidgetStatePropertyAll(Size(double.infinity, 50))),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: User.getDummyUsers().length,
              //     itemBuilder: (context, index) {
              //       final user = User.getDummyUsers()[index];
              //       return ListTile(
              //         leading: CircleAvatar(
              //           backgroundImage: NetworkImage(user.profileNetworkUrl),
              //         ),
              //         title: Text(user.userName),
              //         subtitle: Text(user.lastMessage),
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => Chatscreen(
              //                   user: user,
              //                 ),
              //               ));
              //         },
              //       );
              //     },
              //   ),
              // ),

              userMap != null
                  ? ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.account_box,
                        color: Colors.black,
                      ),
                      title: Text(
                        userMap!['name'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(userMap!['email']),
                      trailing: GestureDetector(
                        onTap: () {
                          if (auth.currentUser != null &&
                              auth.currentUser!.displayName != null) {
                            String roomId = chatRoomId(
                              auth.currentUser!.displayName!,
                              userMap!['name'],
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatRoom(
                                  chatRoomId: roomId,
                                  userMap: userMap!,
                                ),
                              ),
                            );
                          } else {
                            print('Current user: ${auth.currentUser}');
                            print(
                                'Current user display name: ${auth.currentUser?.displayName}');
                            print(
                                'User is not authenticated or display name is null');
                            // You may want to show an error message to the user or redirect to a login screen
                          }
                        },
                        child: Icon(
                          Icons.chat,
                          color: Colors.black,
                          size: 27,
                        ),
                      ),
                    )
                  : Container()
            ],
          );
  }
}
