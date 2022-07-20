import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({Key? key, required this.theColor, required this.theChild, this.theOnTapFunc}) : super(key: key);

  final Color theColor;
  final Widget theChild;
  final VoidCallback? theOnTapFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: theOnTapFunc,
      child: Container(
        child: theChild,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: theColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
