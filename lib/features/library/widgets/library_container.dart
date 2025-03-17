import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';
import 'package:vidhyasetu_app/features/library/widgets/file_type.dart';

class LibraryContainer extends StatelessWidget {
  const LibraryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppTheme.smallPadding,
              horizontal: AppTheme.smallPadding,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Data Structure and Algorithm',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppTheme.backgroundColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    FileType(status: 'Offline'),
                    FileType(type: 'Paper'),
                  ],
                ),
                Text(
                  'Computer Science',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.lightGreyColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.1,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppTheme.smallPadding,
              horizontal: AppTheme.smallPadding,
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: AppTheme.backgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.lightGreyColor,
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Asian School of Management and Technology',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppTheme.primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '.',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppTheme.primaryColor,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '4th semester',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppTheme.primaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Icon(
                            UniconsLine.thumbs_up,
                            color: AppTheme.primaryColor,
                            size: 16,
                          ),
                          Text(
                            '4.5',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(
                              color: AppTheme.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            UniconsLine.file_download,
                            color: AppTheme.primaryColor,
                            size: 16,
                          ),
                          Text(
                            '121',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(
                              color: AppTheme.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      UniconsLine.trash,
                      color: AppTheme.errorColor,
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
