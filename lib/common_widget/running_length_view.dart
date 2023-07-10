import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../common/color_extension.dart';

class RunningLengthView extends StatefulWidget {
  final double height;
  const RunningLengthView({super.key, required this.height});

  @override
  State<RunningLengthView> createState() => _RunningLengthViewState();
}

class _RunningLengthViewState extends State<RunningLengthView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Length",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Stack(alignment: Alignment.center, children: [
                  Column(
                    children: [
                      Text(
                        "250.2",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 59,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "km",
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 27),
                      ),
                    ],
                  ),
                  SimpleCircularProgressBar(
                    size: media.width * 0.65,
                    mergeMode: true,
                    animationDuration: 1,
                    backColor: const Color(0xffE6E6E6),
                    progressColors: [TColor.primary],
                    progressStrokeWidth: 15,
                    backStrokeWidth: 15,
                    startAngle: 0,
                    valueNotifier: ValueNotifier(100),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Min 50",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Max 150",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: media.width * 0.9 * 0.7 ),
                  child: Image.asset(
                    "assets/img/r_location.png",
                    width: 25,
                    height: 25,
                  ),
                ),
                Container(
                  height: 1,
                  color: const Color(0xffE6E6E6),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
