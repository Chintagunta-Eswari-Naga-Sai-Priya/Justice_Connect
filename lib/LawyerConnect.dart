import 'package:flutter/material.dart';
import 'home.dart';

class LawyerConnect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffdcab23),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.yellow[100], // lighter color
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add button action
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xffdcab23),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                '+ Lawyer',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  10, // Adjust height as needed
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                children: [
                  LinkedInPostsPage(), // Replace PostWidget with LinkedInPostsPage
                  NetworkPageState(),
                  ProgressPageState(),
                  ChatPageState(),
                  DocumentPageState(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffdcab23),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => _onBottomNavItemTapped(0),
              color: _currentPageIndex == 0 ? Color(0xffbc9320) : Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.network_cell),
              onPressed: () => _onBottomNavItemTapped(1),
              color: _currentPageIndex == 1 ? Color(0xffbc9320) : Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.hourglass_empty),
              onPressed: () => _onBottomNavItemTapped(2),
              color: _currentPageIndex == 2 ? Color(0xffbc9320) : Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () => _onBottomNavItemTapped(3),
              color: _currentPageIndex == 3 ? Color(0xffbc9320) : Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.description),
              onPressed: () => _onBottomNavItemTapped(4),
              color: _currentPageIndex == 4 ? Color(0xffbc9320) : Colors.black,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffdcab23),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('lib/images/user.jpg'),
                    // Profile picture goes here
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Shankar',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Profile Settings'),
              onTap: () {
                // Profile Settings action
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Groups'),
              onTap: () {
                // Groups action
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Case 1 - Police Case'),
              onTap: () {
                // Case 1 action
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Case 2 - Land Case'),
              onTap: () {
                // Case 2 action
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Case 2 - Money Case'),
              onTap: () {
                // Case 2 action
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('EXIT'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Connection {
  String name;
  String imageUrl;
  int starRating;

  Connection({
    required this.name,
    required this.imageUrl,
    required this.starRating,
  });
}

class NetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffdcab23),
        primaryColor: Color(0xffdcab23),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xffdcab23),
          ),
        ),
      ),
      home: NetworkPage(),
    );
  }
}

class NetworkPageState extends StatelessWidget {
  List<Connection> connections = [
    Connection(
        name: "John Doe", imageUrl: "lib/images/lawyer.jpg", starRating: 4),
    Connection(
        name: "Jane Smith", imageUrl: "lib/images/lawyer.jpg", starRating: 5),
    Connection(
        name: "Alice Johnson",
        imageUrl: "lib/images/lawyer.jpg",
        starRating: 3),
    Connection(
        name: "Bob Williams", imageUrl: "lib/images/lawyer.jpg", starRating: 4),
    Connection(
        name: "Emily Brown", imageUrl: "lib/images/lawyer.jpg", starRating: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdcab23),
      body: ListView.builder(
        itemCount: connections.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ExpansionTile(
                tilePadding: EdgeInsets.symmetric(horizontal: 16.0),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(connections[index].imageUrl),
                ),
                title: Text(connections[index].name),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lawyer in High Court',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffdcab23), // Background color
                                onPrimary: Colors.black, // Text color
                              ),
                              child: Text('Accept'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffdcab23), // Background color
                                onPrimary: Colors.black, // Text color
                              ),
                              child: Text('Decline'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffdcab23), // Background color
                                onPrimary: Colors.black, // Text color
                              ),
                              child: Text('View Profile'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        StarRating(starCount: connections[index].starRating),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int starCount;

  StarRating({required this.starCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < starCount) {
          return Icon(Icons.star, color: Color(0xffdcab23));
        } else {
          return Icon(Icons.star_border, color: Color(0xffbc9320));
        }
      }),
    );
  }
}

class LinkedInPostsPage extends StatelessWidget {
  final List<Post> posts = [
    Post(
      userName: 'Private User',
      userImage: 'lib/images/user1.jpg',
      content:
          'Personal Injury Case \na pedestrian, was hit by a distracted driver while crossing the street at a crosswalk.  ',
      timePosted: '2 hours ago',
      postImage: 'lib/images/postimage1.jpg',
    ),
    Post(
      userName: 'Private User',
      userImage: 'lib/images/user1.jpg',
      content:
          'Contract Dispute Case \nVictimentered into a contract with a construction company to renovate her home, but the work was not completed according to the agreed-upon specifications',
      timePosted: '5 hours ago',
      postImage: 'lib/images/postimage2.jpg',
    ),
    Post(
      userName: 'Private User',
      userImage: 'lib/images/user1.jpg',
      content:
          'Criminal Defense Case \nVictim has been accused of burglary after allegedly breaking into a store and stealing merchandise. ',
      timePosted: '10 hours ago',
      postImage: 'lib/images/postimage3.jpg',
    ),
    Post(
      userName: 'Private User',
      userImage: 'lib/images/user1.jpg',
      content:
          'Family Law Case \n Emily and Williams are going through a divorce and are disputing child custody arrangements for their two children. ',
      timePosted: '1 day ago',
      postImage: 'lib/images/postimage4.jpg',
    ),
    Post(
      userName: 'Private User',
      userImage: 'lib/images/user1.jpg',
      content:
          'Real Estate Transaction \nVictim is purchasing a commercial property to expand her business.',
      timePosted: '2 days ago',
      postImage: 'lib/images/postimage5.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffdcab23), // Yellow background color
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostItem(post: posts[index]);
        },
      ),
    );
  }
}

class Post {
  final String userName;
  final String userImage;
  final String content;
  final String timePosted;
  final String postImage;

  Post({
    required this.userName,
    required this.userImage,
    required this.content,
    required this.timePosted,
    required this.postImage,
  });
}

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffd5d0b8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(post.userImage),
              ),
              SizedBox(width: 10),
              Text(
                post.userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(post.content),
          SizedBox(height: 10),
          Image.asset(
            post.postImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle "Take up the case" action
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffdcab23), // Yellow button color
                ),
                child: Text(
                  'Take up the case',
                  style:
                      TextStyle(color: Colors.black), // Blue button text color
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle "Contact the client" action
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffdcab23), // Yellow button color
                ),
                child: Text(
                  'Contact the client',
                  style:
                      TextStyle(color: Colors.black), // Blue button text color
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Posted ${post.timePosted}',
            style: TextStyle(
              color: Color(0xffd5d0b8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final String title;

  const PostWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Post content goes here...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class Case {
  final String caseName;
  final List<String> events;
  final List<String> eventDates;
  final String lawyerName;

  Case(
      {required this.caseName,
      required this.events,
      required this.eventDates,
      required this.lawyerName});
}

class ProgressPageState extends StatelessWidget {
  final List<Case> cases = [
    Case(
      caseName: "Case 3 - Police Case",
      events: [
        "Case Started",
        "Appointment 1",
        "Hearing 1",
        "Hearing 2",
        "Appointment 2",
      ],
      eventDates: [
        "2023-01-01",
        "2023-02-15",
        "2023-03-20",
        "2023-04-10",
        "2023-05-15"
      ],
      lawyerName: "John Doe",
    ),
    Case(
      caseName: "Case 2 - Land Case",
      events: [
        "Case Started",
        "Appointment 1",
        "Hearing 1",
        "Appointment 2",
        "Case Solved"
      ],
      eventDates: [
        "2023-02-01",
        "2023-03-10",
        "2023-04-20",
        "2023-05-10",
        "2023-06-15"
      ],
      lawyerName: "Jane Smith",
    ),
    Case(
      caseName: "Case 3 - Money Case",
      events: [
        "Case Started",
        "Appointment 1",
        "Hearing 1",
        "Appointment 2",
        "Case Solved"
      ],
      eventDates: [
        "2023-03-01",
        "2023-04-15",
        "2023-05-20",
        "2023-06-10",
        "2023-07-15"
      ],
      lawyerName: "Michael Johnson",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffdcab23), // Set the background color of the container
        child: ListView.builder(
          itemCount: cases.length,
          itemBuilder: (context, index) {
            return CaseWidget(caseData: cases[index], isCase1: index == 0);
          },
        ),
      ),
    );
  }
}

class CaseWidget extends StatefulWidget {
  final Case caseData;
  final bool isCase1;

  const CaseWidget({Key? key, required this.caseData, required this.isCase1})
      : super(key: key);

  @override
  _CaseWidgetState createState() => _CaseWidgetState();
}

class _CaseWidgetState extends State<CaseWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.caseData.caseName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ), // Text color
            ),
            subtitle: Text(
              "Lawyer: ${widget.caseData.lawyerName}",
              style: TextStyle(color: Colors.black), // Text color
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            trailing: Icon(_isExpanded
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down),
          ),
          if (widget.isCase1)
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  // Action to schedule a call
                },
                child: Text(
                  "Schedule a Call",
                  style: TextStyle(color: Colors.black), // Text color
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffdcab23), // Button color
                ),
              ),
            ),
          if (_isExpanded)
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < widget.caseData.events.length; i++)
                    Column(
                      children: [
                        Text(
                          widget.caseData.events[i],
                          style: TextStyle(color: Colors.black), // Text color
                        ),
                        Text(
                          "Date: ${widget.caseData.eventDates[i]}",
                          style: TextStyle(color: Colors.black), // Text color
                        ),
                        SizedBox(height: 5),
                        if (i < widget.caseData.events.length - 1)
                          Container(
                            height: 20,
                            width: 2,
                            color: Color(0xffd5d0b8),
                          ),
                        SizedBox(height: 5),
                      ],
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class ChatPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xffdcab23),
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: [
              ChatBubble(
                profilePicture: 'lib/images/goodies.jpg',
                name: 'John Doe',
                designation: 'lawyer',
                recentChat: 'Hey, how are you?',
                lastChatDate: '15th February 2024',
                fullChat: [
                  Message(sender: 'John Doe', text: 'Hey, how are you?'),
                  Message(sender: 'You', text: 'I am good. What about you?'),
                ],
              ),
              SizedBox(height: 20),
              ChatBubble(
                profilePicture: 'lib/images/goodies.jpg',
                name: 'Jane Smith',
                designation: 'High court lawyer',
                recentChat: 'when was the next hearing',
                lastChatDate: '14th February 2024',
                fullChat: [
                  Message(
                      sender: 'Jane Smith', text: 'when was the next hearing'),
                  Message(
                      sender: 'You', text: 'Sure! I will take a look at it.'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String profilePicture;
  final String name;
  final String designation;
  final String recentChat;
  final String lastChatDate;
  final List<Message> fullChat;

  const ChatBubble({
    Key? key,
    required this.profilePicture,
    required this.name,
    required this.designation,
    required this.recentChat,
    required this.lastChatDate,
    required this.fullChat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessagingPageState(
              profilePicture: profilePicture,
              name: name,
              designation: designation,
              fullChat: fullChat,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(profilePicture),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  designation,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(recentChat),
                SizedBox(height: 5),
                Text(
                  'Last chat: $lastChatDate',
                  style: TextStyle(color: Color(0xffd5d0b8)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;

  Message({
    required this.sender,
    required this.text,
  });
}

class MessagingPageState extends StatefulWidget {
  final String profilePicture;
  final String name;
  final String designation;
  final List<Message> fullChat;

  MessagingPageState({
    required this.profilePicture,
    required this.name,
    required this.designation,
    required this.fullChat,
  });

  @override
  ConversationPageState createState() => ConversationPageState();
}

class ConversationPageState extends State<MessagingPageState> {
  final TextEditingController _textController = TextEditingController();
  List<Message> _currentChat = [];

  @override
  void initState() {
    super.initState();
    _currentChat = List.from(widget.fullChat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffdcab23),
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.black), // Set icon color to black
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPageState()),
            ); // This will pop the current route and go back
          },
        ),
      ),
      body: Container(
        color: Color(0xffdcab23),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _currentChat.length,
                itemBuilder: (context, index) {
                  Message message = _currentChat[index];
                  bool isUserMessage = message.sender == 'You';
                  return Align(
                    alignment: isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                        color: isUserMessage ? Colors.orange : Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      _sendMessage(_textController.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String messageText) {
    if (messageText.isNotEmpty) {
      setState(() {
        _currentChat.insert(
            0,
            Message(
                sender: 'You', text: messageText)); // Insert at the beginning
      });
      _textController.clear();
    }
  }
}

class DocumentPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdcab23),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DocumentBox(
              icon: Icons.description,
              name: 'FIR',
              imageUrl:
                  'https://imgv2-1-f.scribdassets.com/img/document/407102441/original/e5460cd1ad/1704093767?v=1xample.com/sample_image.jpg', // Provide image URL
            ),
            SizedBox(height: 20.0),
            DocumentBox(
              icon: Icons.description,
              name: 'Murder Case',
              imageUrl:
                  'data:image/png;base64,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', // Provide image URL
            ),
            SizedBox(height: 20.0),
            DocumentBox(
              icon: Icons.description,
              name: 'House Documents',
              imageUrl:
                  'https://assets-news.housing.com/news/wp-content/uploads/2021/10/11124500/legal-checklist-01.jpg', // Provide image URL
            ),
            SizedBox(height: 20.0),
            DocumentBox(
              icon: Icons.description,
              name: 'Driving License',
              imageUrl:
                  'data:image/jpeg;base64,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', // Provide image URL
            ),
          ],
        ),
      ),
    );
  }
}

class DocumentBox extends StatelessWidget {
  final IconData icon;
  final String name;
  final String imageUrl; // Add imageUrl parameter

  const DocumentBox({
    Key? key,
    required this.icon,
    required this.name,
    required this.imageUrl, // Add imageUrl parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(name),
              content: Image.network(imageUrl), // Display image instead of text
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 10.0),
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
