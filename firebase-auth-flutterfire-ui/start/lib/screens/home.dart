import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:start/screens/library_screen.dart';
import 'package:start/screens/st_screen.dart';
import '../auth_gate.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Image.asset('assets/images/LOGO App.png', height: 40),
            SizedBox(width: 10),
            Text('Welcome'),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: Colors.blue,
      type: BottomNavigationBarType.fixed,  
      onTap: (index) {
        if (index == 3) {
          _showLogoutDialog(context);
        } else if (index == 1) {
          // เปิดหน้า Library
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LibraryScreen()),
          );
        } else if (index == 2) {
          // เปิดหน้า ST
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => STScreen()),
          );
        } else {
          setState(() {
            _currentIndex = index;
          });
        }
      },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/icon home.png', height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/icon ribrary.png', height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/icon bd.png', height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/icon setting.png', height: 30),
            label: '',
          ),
        ],
      ),

    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut(); // ✅ ล็อกเอาต์ออกจาก Firebase
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => AuthGate()), // ✅ กลับไปที่ AuthGate
              (Route<dynamic> route) => false, // ✅ ลบทุกหน้าออกจาก Stack
            );
          },
          child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFDEEE0),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Select Building',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildingCard(context, 'Library', 'assets/images/Library.png'),
                SizedBox(height: 20),
                _buildingCard(context, 'ST', 'assets/images/ST2.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget _buildingCard(BuildContext context, String title, String imagePath) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imagePath, height: 150, fit: BoxFit.cover),
        ),
        SizedBox(height: 10),
        Text(
          title,
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
            // เพิ่มเงื่อนไขในการนำทางไปยังหน้าที่ต้องการตามชื่อของ building
            if (title == 'Library') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LibraryScreen()),
              );
            } else if (title == 'ST') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => STScreen()),
              );
            }
          },
          child: Text('Click Me to Q', style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}
}

