import 'package:flutter/material.dart';
import 'package:start/screens/st_detail.dart';
import 'package:start/screens/st_detail02.dart';

class STScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Image.asset('assets/images/LOGO App.png', height: 40),
            SizedBox(width: 10),
            Text('ST'),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFFDEEE0),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: Text('Search'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/ST2.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Select Room',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              _roomCard(context, 'Room 201', 'assets/images/ST Room.png'),
              SizedBox(height: 20),
              _roomCard(context, 'Room 202', 'assets/images/ST Room.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roomCard(BuildContext context, String roomName, String imagePath) {
    return Center(
      child: Container(
        width: 250,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5)),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imagePath, height: 120, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Text(
              roomName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
            if (roomName == 'Room 201') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StDetail()),
              );
            } else if (roomName == 'Room 202') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StDetail02()),
              );
            }
          },
          child: Text('View Room', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
