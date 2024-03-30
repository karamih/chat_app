import 'package:chat_app/pages/chat_page/chat_page.dart';
import 'package:chat_app/pages/home_page/widgets/main_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home_page';

  const HomePage({super.key});

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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                    MainCard(
                      title: 'Chat',
                      pathIcon: 'assets/images/8139242_3826346.svg',
                      isActive: true,
                      onPressed: () {
                        Navigator.pushNamed(context, ChatPage.routeName);
                      },
                    ),
                    const MainCard(
                        title: 'Image',
                        pathIcon: 'assets/images/12781044_5081333.svg',
                        isActive: false)
                  ],
                ),
              ),
              Container(
                width: width,
                height: height * 0.06,
                decoration: const BoxDecoration(
                    color: Colors.black26,
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
