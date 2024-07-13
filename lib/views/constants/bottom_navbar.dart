import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: 2,
      tabBuilder: (int index, bool isActive) {
        final icon = index == 0 ? Icons.camera_alt : Icons.person;
        return Container(
          decoration: isActive
              ? BoxDecoration(
                  color: Color.fromARGB(255, 218, 234, 241),
                  borderRadius: BorderRadius.circular(10),
                )
              : null,
          child: Icon(
            icon,
            color: Colors.black,
            size: 24.0, // Adjust icon size
          ),
          padding: const EdgeInsets.all(4.0), // Adjust padding
        );
      },
      activeIndex: currentIndex,
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.smoothEdge,
      onTap: onTap,
    );
  }
}
