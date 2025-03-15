import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';
import 'package:vidhyasetu_app/core/widgets/custom_button.dart';
import 'package:vidhyasetu_app/core/widgets/custom_textfield.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170), // Set height properly
        child: AppBar(
          backgroundColor: AppTheme.primaryColor,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Search",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.backgroundColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextfield(
                        controller: searchController,
                        icon: Icon(
                          UniconsLine.search,
                          color: AppTheme.backgroundColor,
                        ),
                        labelText: "Search",
                        hintText: "Search paper, notes, subjects",
                        labelColor: AppTheme.backgroundColor,
                        borderColor: AppTheme.backgroundColor,
                        isObscure: false,
                      ),
                    ),
                    // const SizedBox(width: 10),
                    CustomButton(
                      buttonText: "Search",
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height * 0.06,
                      color: AppTheme.accentColor,
                      textColor: AppTheme.secondaryTextColor,
                      borderColor: AppTheme.backgroundColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: const Center(child: Text("Search to find your study material")),
    );
  }
}
