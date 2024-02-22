import 'package:flutter/material.dart';
import 'home.dart';

class EmergencyContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EmergencyContacts',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: EmergencyContactsPage(),
    );
  }
}

class EmergencyContactsPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<EmergencyContactsPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HumanRightsPage(),
    SocialJusticePage(),
    WomenWelfarePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency Contacts"),
        backgroundColor: Color(0xffdcab23),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ); // This will pop the current route and go back
          },
        ),
      ),
      backgroundColor: Color(0xffdcab23),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _onItemTapped(0),
                style: ElevatedButton.styleFrom(
                  primary: _selectedIndex == 0
                      ? Color(0xffbc9320)
                      : Color(0xffdcab23),
                  minimumSize: Size(100, 50), // Adjust minimum size here
                  padding: EdgeInsets.symmetric(
                      vertical: 8), // Adjust vertical padding here
                ),
                child: Text(
                  'Human\nRights',
                  textAlign: TextAlign.center,
                ),
              ),
              VerticalDivider(),
              ElevatedButton(
                onPressed: () => _onItemTapped(1),
                style: ElevatedButton.styleFrom(
                  primary: _selectedIndex == 1
                      ? Color(0xffbc9320)
                      : Color(0xffdcab23),
                  minimumSize: Size(100, 50), // Adjust minimum size here
                  padding: EdgeInsets.symmetric(
                      vertical: 8), // Adjust vertical padding here
                ),
                child: Text(
                  'Social\nJustice',
                  textAlign: TextAlign.center,
                ),
              ),
              VerticalDivider(),
              ElevatedButton(
                onPressed: () => _onItemTapped(2),
                style: ElevatedButton.styleFrom(
                  primary: _selectedIndex == 2
                      ? Color(0xffbc9320)
                      : Color(0xffdcab23),
                  minimumSize: Size(100, 50), // Adjust minimum size here
                  padding: EdgeInsets.symmetric(
                      vertical: 8), // Adjust vertical padding here
                ),
                child: Text(
                  'Women\nWelfare',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

class HumanRightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrganizationCard(
          name: 'Amnesty International',
          logo: 'lib/images/NGO1.jpg',
          info: 'Fighting for human rights worldwide',
          contactNumbers: ['123-456-7890', '234-567-8901', '345-678-9012'],
        ),
        OrganizationCard(
          name:
              'International Foundation for Crime Prevention and Victim Care (PCVC)',
          logo: 'lib/images/NGO2.jpg',
          info: 'Fighting for human rights worldwide',
          contactNumbers: ['123-456-7890', '234-567-8901', '345-678-9012'],
        ),
        OrganizationCard(
          name: 'CREA (Creating Resources for Empowerment in Action):',
          logo: 'lib/images/NGO3.jpg',
          info: 'Fighting for human rights worldwide',
          contactNumbers: ['123-456-7890', '234-567-8901', '345-678-9012'],
        ),
        // Add more OrganizationCard widgets for Human Rights organizations
      ],
    );
  }
}

class SocialJusticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrganizationCard(
          name: 'Jan Sahas Social Development Society',
          logo: 'lib/images/NGO4.jpg',
          info: 'Promoting justice in transitional societies',
          contactNumbers: ['456-789-0123', '567-890-1234', '678-901-2345'],
        ),
        OrganizationCard(
          name: 'Tiljala SHED',
          logo: 'lib/images/NGO5.jpg',
          info: 'Promoting justice in transitional societies',
          contactNumbers: ['456-789-0123', '567-890-1234', '678-901-2345'],
        ),
        OrganizationCard(
          name: 'Centre for Social Action',
          logo: 'lib/images/NGO6.jpg',
          info: 'Promoting justice in transitional societies',
          contactNumbers: ['456-789-0123', '567-890-1234', '678-901-2345'],
        ),
        // Add more OrganizationCard widgets for Social Justice organizations
      ],
    );
  }
}

class WomenWelfarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrganizationCard(
          name: 'Global Fund for Women',
          logo: 'lib/images/NGO7.jpg',
          info: 'Supporting women\'s rights groups worldwide',
          contactNumbers: ['789-012-3456', '890-123-4567', '901-234-5678'],
        ),
        OrganizationCard(
          name: 'Creating Resources for Empowerment in Action',
          logo: 'lib/images/NGO3.jpg',
          info: 'Supporting women\'s rights groups worldwide',
          contactNumbers: ['789-012-3456', '890-123-4567', '901-234-5678'],
        ),
        OrganizationCard(
          name: 'Hope Foundation',
          logo: 'lib/images/NGO9.jpg',
          info: 'Supporting women\'s rights groups worldwide',
          contactNumbers: ['789-012-3456', '890-123-4567', '901-234-5678'],
        ),
        // Add more OrganizationCard widgets for Women Welfare organizations
      ],
    );
  }
}

class OrganizationCard extends StatelessWidget {
  final String name;
  final String logo;
  final String info;
  final List<String> contactNumbers;

  const OrganizationCard({
    required this.name,
    required this.logo,
    required this.info,
    required this.contactNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(
          logo,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              info,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Contact Numbers:'),
            SizedBox(height: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: contactNumbers.map((number) => Text(number)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
