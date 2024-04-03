import 'package:chat_app/pages/home_page/home_page.dart';
import 'package:chat_app/pages/splash/bloc/splash_cubit.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash_screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DelayedDisplay(
                    slidingBeginOffset: const Offset(0, -1),
                    delay: const Duration(milliseconds: 800),
                    child: Container(
                      height: width * 0.7,
                      width: width * 0.7,
                      decoration: const BoxDecoration(
                          color: Colors.white70, shape: BoxShape.circle),
                      child: Center(
                        child: SizedBox(
                          width: width * 0.6,
                          height: width * 0.6,
                          child: SvgPicture.asset(
                            'assets/images/12781044_5081333.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const DelayedDisplay(
                    delay: Duration(milliseconds: 1200),
                    slidingBeginOffset: Offset(0, 1),
                    child: Text(
                      "Chattito",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          letterSpacing: 4),
                    ),
                  )
                ],
              ),
            ),
            BlocConsumer<SplashCubit, SplashState>(
              builder: (context, state) {
                if (state.connect is ConnectionInitial ||
                    state.connect is ConnectionOff) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'No Connection',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<SplashCubit>(context)
                                .checkConnectionEvent();
                          },
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.grey,
                          ))
                    ],
                  );
                } else if (state.connect is ConnectionOn) {
                  return LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.grey, size: 40);
                } else {
                  return Container();
                }
              },
              listener: (context, state) {
                if (state.connect is ConnectionOn) {
                  goToHome();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> goToHome() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName,
            ModalRoute.withName(HomePage.routeName));
      },
    );
  }
}
