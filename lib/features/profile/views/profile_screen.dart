import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final TextEditingController titleController = TextEditingController();
    List _items = [
      {
        "title": "Data Structures and Algorithms",
        "type": "Notes",
        "stream": "Computer Science",
      },
      {
        "title": "Operating Systems",
        "type": "Paper",
        "stream": "Computer Science",
      },
      {
        "title": "Machine Learning",
        "type": "Notes",
        "stream": "Computer Science",
      },
      {
        "title": "Data Structures and Algorithms",
        "type": "Notes",
        "stream": "Computer Science",
      },
      {
        "title": "Operating Systems",
        "type": "Paper",
        "stream": "Computer Science",
      },
      {
        "title": "Machine Learning",
        "type": "Notes",
        "stream": "Computer Science",
      },
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: AppTheme.primaryColor,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppTheme.backgroundColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.push('/profileSetting'),
                      child: Icon(
                        UniconsLine.setting,
                        color: AppTheme.backgroundColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            spacing: 10,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppTheme.defaultPadding,
                  vertical: AppTheme.defaultPadding / 2,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Top Section
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor, // Dark Blue
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Image(
                              image: AssetImage('images/app_logo.png'),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "John Doe",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "MIT University\n4th Semester",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.accentColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "450 Points",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Middle Section (Bio)
                    Padding(
                      padding: EdgeInsets.all(AppTheme.defaultPadding),
                      child: Text(
                        "Computer Science student passionate about algorithms and data structures.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.secondaryTextColor,
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatItem("12", "Uploads"),
                          _buildStatItem("87", "Downloads"),
                          _buildStatItem("4", "Level"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Lower section
              Padding(
                padding: const EdgeInsets.only(left: AppTheme.defaultPadding),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "My Uploads",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _uploadContainerWidget(
                    context,
                    _items[index]['title'],
                    _items[index]['type'],
                    _items[index]['stream'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildStatItem(String value, String label) {
  return Column(
    children: [
      Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
    ],
  );
}

Widget _uploadContainerWidget(
  BuildContext context,
  String title,
  String type,
  String stream,
) {
  return Padding(
    padding: const EdgeInsets.all(AppTheme.defaultPadding),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.secondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      type == "Paper"
                          ? AppTheme.accentColor
                          : AppTheme.successColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    color:
                        type == "Paper"
                            ? AppTheme.secondaryTextColor
                            : AppTheme.backgroundColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            stream,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppTheme.greyColor,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "2 months ago",
                  style: TextStyle(
                    color: AppTheme.backgroundColor,
                    fontSize: 12,
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      UniconsLine.thumbs_up,
                      color: AppTheme.primaryColor,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text("124", style: TextStyle(color: AppTheme.primaryColor)),
                    SizedBox(width: 12),
                    Icon(
                      UniconsLine.file_download,
                      color: AppTheme.primaryColor,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text("89", style: TextStyle(color: AppTheme.primaryColor)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
