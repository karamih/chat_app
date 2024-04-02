import 'package:chat_app/config/storage/shared_prefrences.dart';
import 'package:chat_app/pages/profile_page/utils/avatars.dart';
import 'package:chat_app/pages/profile_page/widgets/custom_bottom_sheet.dart';
import 'package:chat_app/pages/profile_page/widgets/custom_dialog.dart';
import 'package:chat_app/pages/profile_page/widgets/main_profile_card.dart';
import 'package:chat_app/pages/profile_page/widgets/restart.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile_page';
  final SharedPrefrencesStorage storage;

  const ProfilePage({super.key, required this.storage});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final height = MediaQuery.of(context).size.height;
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.black54)),
        backgroundColor: Colors.black26,
        elevation: 1,
        bottom:
            const PreferredSize(preferredSize: Size(0, 20), child: SizedBox()),
        toolbarHeight: 60,
      ),
      backgroundColor: Colors.blueGrey[900],
// <<<<<<< HEAD
      body: SingleChildScrollView(
        child: SizedBox(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.15,
                ),
                DelayedDisplay(
                  delay: const Duration(milliseconds: 300),
                  slidingBeginOffset: const Offset(0, -1),
                  child: MainProfileCard(
                    title: 'Avatar',
                    pathIcon:
                        'assets/images/account-avatar-profile-user-svgrepo-com.svg',
                    onPressed: () =>
                        CustomBottomSheet.showAvatarSelection(context, avatars),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                DelayedDisplay(
                  delay: const Duration(milliseconds: 500),
                  slidingBeginOffset: const Offset(0, -1),
                  child: MainProfileCard(
                    title: 'Username',
                    pathIcon: 'assets/images/user-id-svgrepo-com.svg',
                    onPressed: () {
                      CustomDialog.showUsernameInputDialog(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                DelayedDisplay(
                  delay: const Duration(milliseconds: 800),
                  slidingBeginOffset: const Offset(0, -1),
                  child: MainProfileCard(
                    title: 'Key',
                    pathIcon: 'assets/images/key-svgrepo-com.svg',
                    onPressed: () => CustomDialog.showGeminiKeyDialog(context),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DelayedDisplay(
                  delay: const Duration(milliseconds: 1000),
                  slidingBeginOffset: const Offset(0, 1),
                  child: Restart(
                    onPressed: () =>
                        CustomDialog.showResetDataDialog(context, storage),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
