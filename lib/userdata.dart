class User {
  final String profileNetworkUrl;
  final String userName;
  final String lastMessage;

  User({
    required this.profileNetworkUrl,
    required this.userName,
    required this.lastMessage,
  });

  // Dummy data list
  static List<User> getDummyUsers() {
    return [
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
        userName: 'John Doe',
        lastMessage: 'Hey, how have you been?',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
        userName: 'Jane Smith',
        lastMessage: 'Let\'s catch up soon!',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
        userName: 'Michael Johnson',
        lastMessage: 'Did you see the latest movie?',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
        userName: 'Emily Davis',
        lastMessage: 'I\'ll call you later.',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
        userName: 'David Brown',
        lastMessage: 'Thanks for the help today!',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
        userName: 'John Doe',
        lastMessage: 'Hey, how have you been?',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
        userName: 'Jane Smith',
        lastMessage: 'Let\'s catch up soon!',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
        userName: 'Michael Johnson',
        lastMessage: 'Did you see the latest movie?',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
        userName: 'Emily Davis',
        lastMessage: 'I\'ll call you later.',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
        userName: 'David Brown',
        lastMessage: 'Thanks for the help today!',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
        userName: 'John Doe',
        lastMessage: 'Hey, how have you been?',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
        userName: 'Jane Smith',
        lastMessage: 'Let\'s catch up soon!',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
        userName: 'Michael Johnson',
        lastMessage: 'Did you see the latest movie?',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
        userName: 'Emily Davis',
        lastMessage: 'I\'ll call you later.',
      ),
      User(
        profileNetworkUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
        userName: 'David Brown',
        lastMessage: 'Thanks for the help today!',
      ),
    ];
  }
}
