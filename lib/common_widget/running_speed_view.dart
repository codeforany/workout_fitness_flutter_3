import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../common/color_extension.dart';
import 'clock_tick.dart';

class RunningSpeedView extends StatefulWidget {
  final double height;
  const RunningSpeedView({super.key, required this.height});

  @override
  State<RunningSpeedView> createState() => _RunningSpeedViewState();
}

class _RunningSpeedViewState extends State<RunningSpeedView> {
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
                    "Speed",
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
                        "1.200",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 59,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "min/km",
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 27),
                      ),
                    ],
                  ),
                  Container(
                    width: media.width * 0.55,
                    height: media.width * 0.55,
                    child: CustomPaint(
                      painter: ClockTick(),
                    ),
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
                    valueNotifier: ValueNotifier(75),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      1,
                      2,
                      3,
                      4,
                      5,
                      6,
                      7,
                      8,
                      9,
                      10,
                      11,
                      12,
                      13,
                      14,
                      15,
                      16,
                      17,
                      18,
                      19,
                      20,
                      21,
                      22,
                      23,
                      24
                    ].map((valObj) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: 10,
                        height: 40,
                        decoration: BoxDecoration(
                          color: valObj == 10
                              ? TColor.primary
                              : const Color(0xffE6E6E6),
                        ),
                      );
                    }).toList()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
