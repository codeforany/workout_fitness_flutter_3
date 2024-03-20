import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class LanguageRow extends StatelessWidget {
  final Map tObj;
  final VoidCallback onPressed;
  final bool isActive;
  const LanguageRow(
      {super.key,
      required this.tObj,
      required this.isActive,
      required this.onPressed});

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

            if(isActive)
            Image.asset(
              "assets/img/tick.png",
              width: 30,
              height: 30
            )
          ],
        ),
      ),
    );
  }
}
