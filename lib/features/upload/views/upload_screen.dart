import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';
import 'package:vidhyasetu_app/core/widgets/custom_button.dart';
import 'package:vidhyasetu_app/core/widgets/custom_textfield.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: AppTheme.primaryColor,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Upload",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.backgroundColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Share your materials with others",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.backgroundColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 1),
            CustomTextfield(
              controller: titleController,
              labelText: "Title",
              isObscure: false,
              hintText: "e.g. ASMT Pre-board DSA",
              hintColor: AppTheme.primaryColor.withAlpha(90),
            ),
            CustomTextfield(
              controller: titleController,
              labelText: "Subject",
              isObscure: false,
              hintText: "e.g. Data Structures and Algorithms",
              hintColor: AppTheme.primaryColor.withAlpha(90),
            ),
            CustomTextfield(
              controller: titleController,
              labelText: "Semester",
              isObscure: false,
              hintText: "Enter semester",
              hintColor: AppTheme.primaryColor.withAlpha(90),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppTheme.defaultPadding),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Upload PDF or image"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.defaultPadding,
              ),
              child: DottedBorder(
                color: Colors.black,
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                strokeWidth: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundColor.withAlpha(90),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Select a file to upload",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppTheme.primaryColor,
                          fontSize: 14,
                        ),
                      ),
                      CustomButton(
                        buttonText: "Browse Files",
                        icon: UniconsLine.file,
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.06,
                        color: AppTheme.backgroundColor,
                        textColor: AppTheme.secondaryTextColor,
                        borderColor: AppTheme.backgroundColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppTheme.defaultPadding),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Maximun file size: 10MB, Supported formats: PDF, PNG, JPG",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 10),
                ),
              ),
            ),
            CustomButton(buttonText: "Submit for review"),
            Padding(
              padding: EdgeInsets.only(left: AppTheme.defaultPadding),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your upload will be reviewed by moderators before being published",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
