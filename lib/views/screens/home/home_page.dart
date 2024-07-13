import 'package:flutter/material.dart';
import 'package:fashion_lens/views/constants/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _navigateToMan() {
    Navigator.pushNamed(context, '/man');
  }

  void _navigateToWoman() {
    Navigator.pushNamed(context, '/woman');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFC6AC),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 40,
              height: 40,
            ),
            SizedBox(width: 8),
            Text(
              'Fashion Lens',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _navigateToMan,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 215, 228, 242),
                padding: EdgeInsets.all(32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  'assets/man.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            SizedBox(width: 30),
            ElevatedButton(
              onPressed: _navigateToWoman,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 251, 207, 187),
                padding: EdgeInsets.all(32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  'assets/woman.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (index) {
              case 0:
                Navigator.pushReplacementNamed(context, '/homepage');
                break;
              case 1:
                Navigator.pushReplacementNamed(context, '/profile');
                break;
            }
          });
        },
      ),
    );
  }
}
