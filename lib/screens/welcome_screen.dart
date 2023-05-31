import 'package:flutter/material.dart';

import 'package:ui/widgets/bottom_container.dart';
import 'package:ui/widgets/primary_button.dart';

class WelecomeScreen extends StatefulWidget {
  const WelecomeScreen({super.key});

  @override
  State<WelecomeScreen> createState() => _WelecomeScreenState();
}

class _WelecomeScreenState extends State<WelecomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                  image: AssetImage(
                    'assets/images/welcome.png',
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: BottomContainer(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
                child: Column(
                  children: [
                    const Text(
                      'Welcome to ',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'CrowdAfrik is a Financial technology fintech initiative with a broad range of ideas that aim to provide support, finances and deploy technical exchanges to Africans with the main goal of poverty reduction, industrial development and creating job opportunities.',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryButton(
                        isIconed: true,
                        onPress: () {
                          Navigator.pushNamed(
                              context,
                              '/signin'
                              );
                        },
                        buttonText: 'GET STARTED')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
