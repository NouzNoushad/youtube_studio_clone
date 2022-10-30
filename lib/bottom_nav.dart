import 'package:flutter/material.dart';
import 'package:youtube_studio_clone/analytics.dart';
import 'package:youtube_studio_clone/comment.dart';
import 'package:youtube_studio_clone/content.dart';
import 'package:youtube_studio_clone/dashboard.dart';
import 'package:youtube_studio_clone/monetize.dart';

class YoutubeStudioBNB extends StatefulWidget {
  const YoutubeStudioBNB({super.key});

  @override
  State<YoutubeStudioBNB> createState() => _YoutubeStudioBNBState();
}

class _YoutubeStudioBNBState extends State<YoutubeStudioBNB> {
  Widget getWidgets(index) {
    switch (index) {
      case 0:
        return const StudioDashboard();
      case 1:
        return const StudioContent();
      case 2:
        return const StudioAnalytics();
      case 3:
        return const StudioComment();
      case 4:
        return const StudioMonetize();
    }
    return Container();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int? value) {
          setState(() {
            _currentIndex = value!;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            tooltip: "",
            icon: Icon(Icons.dashboard_outlined),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            tooltip: "",
            icon: Icon(Icons.content_copy),
            label: "Content",
          ),
          BottomNavigationBarItem(
            tooltip: "",
            icon: Icon(Icons.analytics_outlined),
            label: "Analytics",
          ),
          BottomNavigationBarItem(
            tooltip: "",
            icon: Icon(Icons.comment_outlined),
            label: "Comment",
          ),
          BottomNavigationBarItem(
            tooltip: "",
            icon: Icon(Icons.attach_money_outlined),
            label: "Monetize",
          ),
        ],
      ),
      body: getWidgets(_currentIndex),
    );
  }
}
