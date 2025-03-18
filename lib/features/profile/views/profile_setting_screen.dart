import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';
import 'package:vidhyasetu_app/core/config/app_theme.dart';
import 'package:vidhyasetu_app/core/widgets/custom_button.dart';
import 'package:vidhyasetu_app/core/widgets/custom_textfield.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController bioController = TextEditingController();
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(UniconsLine.angle_left),
          iconSize: 30,
          color: AppTheme.backgroundColor,
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Setting',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppTheme.backgroundColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          children: [
            _buildProfileSection(
              context,
              fullNameController,
              emailController,
              bioController,
            ),
            SizedBox(height: 20),
            _buildSecuritySection(
              context,
              currentPasswordController,
              newPasswordController,
              confirmPasswordController,
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonText: "Logout",
              icon: UniconsLine.exit,
              color: AppTheme.errorColor,
              borderColor: AppTheme.errorColor,
            ),
            SizedBox(height: 10),
            Text("Vidhya Setu v1.0.0 • Terms • Privacy"),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(
    BuildContext context,
    TextEditingController fullName,
    TextEditingController email,
    TextEditingController bio,
  ) {
    return Container(
      padding: EdgeInsets.all(AppTheme.defaultPadding),
      width: double.infinity,
      decoration: _containerDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            context,
            "Profile Information",
            "Update Profile Information",
          ),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('images/app_logo.png'),
                  backgroundColor: AppTheme.backgroundColor,
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      UniconsLine.camera,
                      size: 30,
                      color: AppTheme.backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          CustomTextfield(
            controller: fullName,
            labelText: "Full Name",
            isObscure: false,
            icon: Icon(UniconsLine.user),
          ),
          SizedBox(height: 10),
          CustomTextfield(
            controller: email,
            labelText: "Email",
            isObscure: false,
            icon: Icon(UniconsLine.envelope),
          ),
          SizedBox(height: 10),
          CustomTextfield(
            controller: bio,
            labelText: "Bio",
            isObscure: false,
            icon: Icon(UniconsLine.info_circle),
          ),
          SizedBox(height: 20),
          CustomButton(buttonText: "Save Changes"),
        ],
      ),
    );
  }

  Widget _buildSecuritySection(
    BuildContext context,
    TextEditingController currentPassword,
    TextEditingController newPassword,
    TextEditingController confirmPassword,
  ) {
    return Container(
      padding: EdgeInsets.all(AppTheme.defaultPadding),
      width: double.infinity,
      decoration: _containerDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            context,
            "Account Security",
            "Manage your password and security settings",
          ),
          SizedBox(height: 15),
          CustomTextfield(
            controller: currentPassword,
            labelText: "Current Password",
            isObscure: true,
            icon: Icon(UniconsLine.lock),
          ),
          SizedBox(height: 10),
          CustomTextfield(
            controller: newPassword,
            labelText: "New Password",
            isObscure: true,
            icon: Icon(UniconsLine.lock),
          ),
          SizedBox(height: 10),
          CustomTextfield(
            controller: confirmPassword,
            labelText: "Confirm Password",
            isObscure: true,
            icon: Icon(UniconsLine.lock),
          ),
          SizedBox(height: 20),
          CustomButton(buttonText: "Update Password"),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
    String subtitle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: AppTheme.primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: AppTheme.lightGreyColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: AppTheme.backgroundColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppTheme.lightGreyColor, width: 1),
      boxShadow: [
        BoxShadow(
          color: AppTheme.lightGreyColor,
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    );
  }
}
