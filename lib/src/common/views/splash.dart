import 'package:assign/src/features/home/view/home_page.dart';
import 'package:assign/src/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.go(HomePageView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
