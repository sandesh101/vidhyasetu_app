import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:unicons/unicons.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';
import '../pages.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int selectedNavBarIndex = 0;
  void onNavBarTapped(int index) {
    setState(() {
      selectedNavBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages.pagesList[selectedNavBarIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
        ),
        child: GNav(
          backgroundColor: AppTheme.backgroundColor,
          color: AppTheme.greyColor,
          activeColor: AppTheme.secondaryTextColor,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          onTabChange: onNavBarTapped,
          selectedIndex: selectedNavBarIndex,
          tabs: const [
            GButton(icon: UniconsLine.home_alt, text: "Home"),
            GButton(icon: UniconsLine.search, text: "Search"),
            GButton(icon: UniconsLine.upload, text: "Upload"),
            GButton(icon: UniconsLine.book, text: "Library"),
            GButton(icon: UniconsLine.user, text: "Profile"),
          ],
        ),
      ),
    );
  }
}
