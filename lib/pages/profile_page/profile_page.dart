import 'package:chat_app/pages/profile_page/utils/avatars.dart';
import 'package:chat_app/pages/profile_page/widgets/custom_bottom_sheet.dart';
import 'package:chat_app/pages/profile_page/widgets/custom_dialog.dart';
import 'package:chat_app/pages/profile_page/widgets/main_profile_card.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile_page';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 2),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.black26,
        elevation: 1,
        bottom:
            const PreferredSize(preferredSize: Size(0, 20), child: SizedBox()),
        toolbarHeight: 60,
      ),
      backgroundColor: Colors.blueGrey[900],
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               MainProfileCard(
                title: 'Avatar',
                pathIcon:
                    'assets/images/account-avatar-profile-user-svgrepo-com.svg',
                onPressed: () => CustomBottomSheet.showAvatarSelection(context, avatars),
              ),
              const SizedBox(
                height: 10,
              ),
              MainProfileCard(
                title: 'Username',
                pathIcon: 'assets/images/user-id-svgrepo-com.svg',
                onPressed: () {
                  CustomDialog.showUsernameInputDialog(context);
                },
              ),
              const SizedBox(
                height: 10,
              ),
               MainProfileCard(
                title: 'Key',
                pathIcon: 'assets/images/key-svgrepo-com.svg',
                 onPressed: () => CustomDialog.showGeminiKeyDialog(context),
              ),
            ],
          )),
    );
  }
}
