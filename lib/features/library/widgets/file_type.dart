import 'package:flutter/material.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';

class FileType extends StatelessWidget {
  final String? type;
  final String? status;
  const FileType({super.key, this.type, this.status});

  @override
  Widget build(BuildContext context) {
    final isOffline = status == 'Offline';
    final isPaper = type == "Paper";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color:
            isOffline
                ? AppTheme.successColor
                : (isPaper ? AppTheme.accentColor : AppTheme.successColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isOffline ? status ?? '' : type ?? '',
        style: TextStyle(
          color:
              isOffline || !isPaper
                  ? AppTheme.backgroundColor
                  : AppTheme.secondaryTextColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
