import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';
import 'package:vidhyasetu_app/core/widgets/custom_textfield.dart';
import 'package:vidhyasetu_app/features/home/widgets/detail_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 170,
        backgroundColor: AppTheme.primaryColor,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vidhya Setu",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.backgroundColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(UniconsLine.bell, color: AppTheme.backgroundColor),
              ],
            ),
            SizedBox(height: 10),
            CustomTextfield(
              controller: searchController,
              icon: Icon(UniconsLine.search, color: AppTheme.backgroundColor),
              labelText: "Search",
              labelColor: AppTheme.backgroundColor,
              borderColor: AppTheme.backgroundColor,
              isObscure: false,
            ),
            TabBar(
              controller: _tabController,
              tabs: [Tab(text: "Question Papers"), Tab(text: "Notes")],
              labelColor: AppTheme.backgroundColor,
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppTheme.backgroundColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: AppTheme.accentColor,
              indicatorColor: AppTheme.backgroundColor,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DetailContainer();
                  },
                ),
              ),
            ],
          ),
          // Tab 2: Notes
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DetailContainer();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
