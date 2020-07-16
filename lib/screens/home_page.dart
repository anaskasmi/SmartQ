import 'package:SmartQ/screens/agencies.dart';
import 'package:SmartQ/screens/favorites.dart';
import 'package:SmartQ/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:SmartQ/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';

class HomePage extends StatefulWidget {
  final titles = ['Agences', 'Profil'];
  final colors = [
    Colors.lightBlue.shade900,
    // Colors.blue,
    Colors.blue,
  ];
  final icons = [
    Icons.location_on,
    // Icons.star_border,
    CupertinoIcons.profile_circled,
  ];
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthProvider authProvider;

  PageController _pageController;
  MenuPositionController _menuPositionController;
  bool userPageDragging = false;

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  Padding getIcon(int index, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Icon(widget.icons[index], size: 30, color: color),
    );
  }

  @override
  void initState() {
    _menuPositionController = MenuPositionController(initPosition: 0);

    _pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    _pageController.addListener(handlePageChange);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    this.authProvider = Provider.of<AuthProvider>(context);
    super.didChangeDependencies();
  }

  void checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
    if (userPageDragging) {
      _menuPositionController.findNearestTarget(_pageController.page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            checkUserDragging(scrollNotification);
          },
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              Agencies(),
              // Favorites(),
              Profile(),
            ],
            onPageChanged: (page) {},
          ),
        ),
        bottomNavigationBar: BubbledNavigationBar(
          controller: _menuPositionController,
          initialIndex: 0,
          itemMargin: EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: Colors.white,
          defaultBubbleColor: Colors.blue,
          onTap: (index) {
            _pageController.animateToPage(index,
                curve: Curves.easeInOutQuad,
                duration: Duration(milliseconds: 500));
          },
          items: widget.titles.map((title) {
            var index = widget.titles.indexOf(title);
            var color = widget.colors[index];
            return BubbledNavigationBarItem(
              icon: getIcon(index, color),
              activeIcon: getIcon(index, Colors.white),
              bubbleColor: color,
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            );
          }).toList(),
        ));
  }
}
