import 'package:flutter/material.dart';
import 'package:tiktok_clone/Core/Explore/explore_view.dart';
import 'package:tiktok_clone/Core/Feed/View/feed_view.dart';
import 'package:tiktok_clone/Core/Notification/View/notification_view.dart';
import 'package:tiktok_clone/Core/Profile/View/current_profile_view.dart';
import 'package:tiktok_clone/Core/UploadPost/View/media_selector_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  _MainTabViewState createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _selectedIndex = 0;
  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      FeedView(),
      const ExploreView(),
      MediaSelectorView(resetAndNavigateToFeed: resetAndNavigateToFeed),
      NotificationView(),
      CurrentProfileView(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  void resetAndNavigateToFeed() {
    setState(() {
      _selectedIndex = 0; // FeedViewへのインデックス
    });
  }
}
