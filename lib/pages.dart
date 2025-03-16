import 'package:flutter/material.dart';
import 'package:vidhyasetu_app/features/home/views/home_page.dart';
import 'package:vidhyasetu_app/features/library/views/library_screen.dart';
import 'package:vidhyasetu_app/features/profile/views/profile_screen.dart';
import 'package:vidhyasetu_app/features/search/views/search_page.dart';
import 'package:vidhyasetu_app/features/upload/views/upload_screen.dart';

class Pages {
  static const List<Widget> pagesList = [
    HomePage(),
    SearchPage(),
    UploadScreen(),
    LibraryScreen(),
    ProfileScreen(),
  ];
}
