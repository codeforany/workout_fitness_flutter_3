
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class MenuCell extends StatelessWidget {
  final Map mObj;
  final VoidCallback onPressed;

  const MenuCell({super.key, required this.mObj, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: TColor.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2)
            ),
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset( mObj["image"].toString() , width: 35, height: 35, fit: BoxFit.contain,),

            const SizedBox(height: 10,),

            Text(mObj["name"],
                style: TextStyle(
                    fontSize: 14,
                    color: TColor.secondaryText,
                    fontWeight: FontWeight.w700))

          ],
        ),
      ),
    );
  }
}