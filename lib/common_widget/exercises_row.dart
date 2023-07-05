import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class ExercisesRow extends StatelessWidget {
  final String number;
  final String title;
  final String time;
  final bool isActive;
  final bool isLast;
  final VoidCallback onPressed;
  const ExercisesRow(
      {super.key,
      required this.number,
      required this.title,
      required this.time,
      this.isActive = false,
      this.isLast = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: isActive
                    ? TColor.primary.withOpacity(0.3)
                    : TColor.gray.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: isActive ? TColor.primary : TColor.gray,
                  borderRadius: BorderRadius.circular(12.5),
                ),
                alignment: Alignment.center,
                child: isLast
                    ? Image.asset(
                        "assets/img/star.png",
                        width: 15,
                        height: 15,
                      )
                    : Text(
                        number,
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                          color: TColor.secondaryText.withOpacity(0.8),
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              "assets/img/information.png",
              width: 20,
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
