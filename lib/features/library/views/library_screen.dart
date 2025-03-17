import 'package:flutter/material.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';
import 'package:vidhyasetu_app/features/library/widgets/library_container.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Library',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppTheme.backgroundColor,
              ),
            ),
            Text(
              'Access your downloaded materials',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppTheme.lightGreyColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.defaultPadding,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) => LibraryContainer(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
