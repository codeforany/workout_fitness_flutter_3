import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SettingSwitchRow extends StatelessWidget {
  final Map tObj;
  final Function(bool)? onChanged;
  const SettingSwitchRow(
      {super.key,
      required this.tObj,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tObj["name"],
              style: TextStyle(
                  color:  TColor.secondaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            CupertinoSwitch(
              activeColor: TColor.primary,
              value: tObj["value"] == "true" , onChanged: onChanged)
          ],
        ),
      
    );
  }
}
