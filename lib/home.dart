import 'package:flutter/material.dart';
import 'package:nakshya/ReportAnIssue.dart';
import 'EmergencyContacts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'NGOPage.dart';
import 'LawyerConnect.dart';
import 'ReportAnIssue.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffdcab23),
          title: Text(
            'Home Page',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(Icons.menu, color: Colors.black),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.account_circle, color: Color(0xffdcab23)),
                        SizedBox(width: 10),
                        Text(
                          'Edit Profile',
                          style: TextStyle(color: Color(0xffdcab23)),
                        ),
                      ],
                    ),
                    value: 'profile_picture',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Account Settings',
                      style: TextStyle(color: Color(0xffdcab23)),
                    ),
                    value: 'edit_profile',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Color(0xffdcab23)),
                    ),
                    value: 'logout',
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 'profile_picture') {
                  // Handle profile picture action
                } else if (value == 'edit_profile') {
                  // Handle edit profile action
                } else if (value == 'logout') {
                  // Handle logout action
                }
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LawyerConnect()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffdcab23),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        height: MediaQuery.of(context).size.width / 2 - 15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.account_balance,
                                size: 50, color: Colors.black),
                            SizedBox(height: 15),
                            Text('Lawyer Connect',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReportIssue()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffdcab23),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        height: MediaQuery.of(context).size.width / 2 - 15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.report, size: 50, color: Colors.black),
                            SizedBox(height: 15),
                            Text('Report An Issue',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NGOPage()),
                        );
                        // Navigate to NGO Connect screen
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffdcab23),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        height: MediaQuery.of(context).size.width / 2 - 15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.people, size: 50, color: Colors.black),
                            SizedBox(height: 10),
                            Text('NGO Connect',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmergencyContacts()),
                        );
                        // Navigate to Emergency Contacts screen
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffdcab23),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        height: MediaQuery.of(context).size.width / 2 - 15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.contacts, size: 50, color: Colors.black),
                            SizedBox(height: 10),
                            Text('Emergency Contacts',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Color(0xffdcab23),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: CalendarWidget(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    _showEmergencyInfoPopup(context);
                    // Add onPressed functionality for emergency button
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffdcab23), // Replaced color here
                    shape: CircleBorder(), // circular shape
                    padding: EdgeInsets.all(70), // increase size
                  ),
                  child: Container(
                    // decoration: BoxDecoration(
                    //   gradient: RadialGradient(
                    //     colors: [
                    //       Color(0xffdcab23),
                    //       Color(0xfffb4141),
                    //     ], // Replaced colors here
                    //     stops: [0.15, 0.75],
                    //     center: Alignment.center,
                    //   ),
                    // ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.warning,
                          size: 50,
                          color: Colors.black,
                        ), // Icon inside the button
                        Text(
                          "Emergency",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                20, // Adjust the font size as per your requirement
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {
    DateTime.utc(2024, 2, 25): ['Meeting with lawyer'],
    DateTime.utc(2024, 2, 26): ['Court hearing'],
    DateTime.utc(2024, 2, 29): ['NGO rally'],
    DateTime.utc(2024, 2, 2): ['Meeting with lawyer'],
    DateTime.utc(2024, 2, 15): ['Court hearing'],
    DateTime.utc(2024, 2, 4): ['NGO rally'],
  };

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      availableCalendarFormats: {
        CalendarFormat.month: '2 Weeks',
        CalendarFormat.twoWeeks: 'Month',
      },
      eventLoader: (day) {
        return _events[day] ?? [];
      },
      calendarBuilders: CalendarBuilders(
        selectedBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black, // White color for selected date circle
            ),
            child: Text(
              '${date.day}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        },
        defaultBuilder: (context, date, _) {
          final events = _events[date];
          final hasEvents = events != null && events.isNotEmpty;
          return Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: hasEvents ? Colors.green : Colors.transparent,
            ),
            child: Text(
              '${date.day}',
              style: TextStyle(
                color: hasEvents ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
        _showEventPopup(context, selectedDay);
      },
    );
  }

  void _showEventPopup(BuildContext context, DateTime selectedDay) {
    // Retrieve events for the selected day
    List<String> events = _events[selectedDay] ?? [];

    // Show a dialog with the events for the selected day
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              'Events on ${selectedDay.day}/${selectedDay.month}/${selectedDay.year}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: events.map((event) => Text(event)).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

void _showEmergencyInfoPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Emergency Reported'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                  'Information about emergency is shared along with location coordinates to police station, hospital, fire station, and she team.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
