import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class ResponsesRow extends StatelessWidget {
  final Map rObj;
  const ResponsesRow({super.key, required this.rObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              rObj["image"],
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(rObj["name"],
                    style: TextStyle(
                        fontSize: 14,
                        color: TColor.secondaryText,
                        fontWeight: FontWeight.w700)),
                Text(rObj["time"],
                    style: TextStyle(
                        fontSize: 12,
                        color: TColor.secondaryText,
                        fontWeight: FontWeight.w300)),
                const SizedBox(
                  height: 4,
                ),
                Text(rObj["message"],
                    style: TextStyle(
                        fontSize: 16,
                        color: TColor.secondaryText))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
