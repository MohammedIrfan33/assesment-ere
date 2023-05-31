import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({super.key, required this.child, this.padding});

  final Widget child;
  EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: child,
    );
  }
}
