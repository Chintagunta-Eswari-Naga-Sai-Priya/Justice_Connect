import 'package:flutter/material.dart';
import 'home.dart';

class ReportIssue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber, // Set the primary color to amber
      ),
      home: ReportIssuePage(),
    );
  }
}

class ReportIssuePage extends StatefulWidget {
  @override
  _ReportIssuePageState createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {
  String _selectedSendTo = "Police Station";

  void _submitReport() {
    // Logic to submit report
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text("Issue successfully reported."),
          actions: <Widget>[
            TextButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report An Issue",
          style: TextStyle(color: Colors.black), // Set text color to black
        ),
        backgroundColor: Color(0xffdcab23),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.black), // Set icon color to black
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ); // This will pop the current route and go back
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Criminal Name',
                border: OutlineInputBorder(), // Add border to text field
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Victim Name',
                border: OutlineInputBorder(), // Add border to text field
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Description of the Incident',
                border: OutlineInputBorder(), // Add border to text field
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Upload Proof of the Incident',
                border: OutlineInputBorder(), // Add border to text field
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(), // Add border to text field
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(), // Add border to text field
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Pin Code',
                border: OutlineInputBorder(), // Add border to text field
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'State',
                border: OutlineInputBorder(), // Add border to text field
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Time',
                border: OutlineInputBorder(), // Add border to text field
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(), // Add border to text field
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              value: _selectedSendTo,
              items: ["Police Station", "Self Help Group", "She Team"]
                  .map((sendTo) {
                return DropdownMenuItem(
                  value: sendTo,
                  child: Text(sendTo),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedSendTo = newValue.toString();
                });
              },
              decoration: InputDecoration(
                labelText: 'Send To',
                border: OutlineInputBorder(), // Add border to dropdown
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitReport,
              child: Text(
                'Report',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(
                    0xffdcab23), // Set the background color of the button to amber
              ),
            ),
          ],
        ),
      ),
    );
  }
}
