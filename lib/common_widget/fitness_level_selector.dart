import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class FitnessLevelSelector extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final bool isSelect;

  const FitnessLevelSelector({super.key, required this.title, required this.subtitle, required this.isSelect, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: onPressed,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 15,
                            top: media.width * 0.05,
                            bottom: media.width * 0.05),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                subtitle,
                                style: TextStyle(
                                    color: isSelect
                                        ? TColor.primary
                                        : TColor.secondaryText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            if (isSelect)
                              Image.asset(
                                "assets/img/tick.png",
                                width: 20,
                                height: 20,
                              )
                          ],
                        ),
                      ),
                    ),
                    Divider(color: TColor.divider, height: 1),
                    SizedBox(height: media.width * 0.05),
                  ],
                ),
              );
  }
}