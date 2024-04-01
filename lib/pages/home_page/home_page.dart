import 'package:chat_app/config/storage/shared_prefrences.dart';
import 'package:chat_app/pages/chat_page/chat_page.dart';
import 'package:chat_app/pages/home_page/widgets/main_card.dart';
import 'package:chat_app/pages/profile_page/profile_page.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home_page';
  final SharedPrefrencesStorage storage;

  const HomePage({super.key, required this.storage});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Chattito",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.black54)),
          backgroundColor: Colors.black26,
          elevation: 0,
          bottom: const PreferredSize(
              preferredSize: Size(0, 20), child: SizedBox()),
          toolbarHeight: 60,
        ),
        backgroundColor: Colors.blueGrey[900],
        body: Container(
          padding: const EdgeInsets.only(top: 25),
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DelayedDisplay(
                      delay: const Duration(milliseconds: 500),
                      slidingBeginOffset: const Offset(0, -1),
                      child: MainCard(
                        title: 'Chat',
                        pathIcon: 'assets/images/12781044_5081333.svg',
                        isActive: true,
                        onPressed: () {
                          if (storage.getAccessToChat()) {
                            Navigator.pushNamed(context, ChatPage.routeName);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Please set your key in the profile page first.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                backgroundColor: Colors.red[300],
                                duration: const Duration(seconds: 3),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                action: SnackBarAction(
                                  label: 'Dismiss',
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  },
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    DelayedDisplay(
                      delay: const Duration(milliseconds: 500),
                      slidingBeginOffset: const Offset(0, 1),
                      child: MainCard(
                        title: 'Profile',
                        pathIcon: 'assets/images/8139242_3826346.svg',
                        isActive: true,
                        onPressed: () {
                          Navigator.pushNamed(context, ProfilePage.routeName);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                height: height * 0.06,
                decoration: const BoxDecoration(
                    color: Colors.black26,
                    border: Border(top: BorderSide(color: Colors.black54)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: const Center(
                  child: Text(
                    'https://2byte.tech',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 2),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
