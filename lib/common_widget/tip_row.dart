import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class TipRow extends StatelessWidget {
  final Map tObj;
  final VoidCallback onPressed;
  final bool isActive;
  const TipRow({super.key, required this.tObj, required this.isActive , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tObj["name"],
              style: TextStyle(
                  color: isActive ? TColor.primary : TColor.secondaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Image.asset(
              "assets/img/next.png",
              width: 25,
              height: 25,
              color: isActive ? TColor.primary : TColor.secondaryText,
            )
          ],
        ),
      ),
    );
  }
}