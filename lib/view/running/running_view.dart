import 'package:flutter/material.dart';
import 'package:workout_fitness/view/running/running_setting_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/running_density_view.dart';
import '../../common_widget/running_heart_view.dart';
import '../../common_widget/running_length_view.dart';
import '../../common_widget/running_speed_view.dart';
import '../../common_widget/running_timer_view.dart';
import '../../common_widget/ruuing_top_button.dart';

class RunningView extends StatefulWidget {
  const RunningView({super.key});

  @override
  State<RunningView> createState() => _RunningViewState();
}

class _RunningViewState extends State<RunningView> {
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: TColor.primary,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/img/black_white.png",
                width: 25,
                height: 25,
              )),
          title: Text(
            "Running",
            style: TextStyle(
                color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              color: TColor.primary,
              alignment: Alignment.bottomCenter,
              child: Container(
                width: media.width * 0.9,
                height: 70,
                decoration: const BoxDecoration(
                  color: Color(0xffF8F6F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    RunningTopButton(
                      icon: "assets/img/r_distance.png",
                      isActive: selectTab == 0,
                      onPressed: () {
                        setState(() {
                          selectTab = 0;
                        });
                      },
                    ),
                    Container(width: 1, height: 40, color: TColor.gray),
                    RunningTopButton(
                      icon: "assets/img/dashboard-half.png",
                      isActive: selectTab == 1,
                      onPressed: () {
                        setState(() {
                          selectTab = 1;
                        });
                      },
                    ),
                    Container(width: 1, height: 40, color: TColor.gray),
                    RunningTopButton(
                      icon: "assets/img/time-wall-clock.png",
                      isActive: selectTab == 2,
                      onPressed: () {
                        setState(() {
                          selectTab = 2;
                        });
                      },
                    ),
                    Container(width: 1, height: 40, color: TColor.gray),
                    RunningTopButton(
                      icon: "assets/img/r_heartbeat.png",
                      isActive: selectTab == 3,
                      onPressed: () {
                        setState(() {
                          selectTab = 3;
                        });
                      },
                    ),
                    Container(width: 1, height: 40, color: TColor.gray),
                    RunningTopButton(
                      icon: "assets/img/Group 1309.png",
                      isActive: selectTab == 4,
                      onPressed: () {
                        setState(() {
                          selectTab = 4;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: media.width * 0.9,
              height: media.height * 0.65,
              decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ]),
              child: Column(children: [
                   if(selectTab == 0)
                    RunningLengthView(height: media.height * 0.65),
                    if(selectTab == 1)
                    RunningSpeedView(height: media.height * 0.65),
                  
                  if(selectTab == 2)
                    RunningTimerView(height: media.height * 0.65),

                  if(selectTab == 3)
                   RunningHeartView(height: media.height * 0.65),

                  if(selectTab == 4)
                   RunningDensityView(height: media.height * 0.65),
                   

              ],)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RunningSettingsView()));
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/img/r_setting.png",
                          width: 25,
                          height: 25,
                        ),
                        const Text(
                          "Setting",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     
                    },
                    child: Container(
                      width: media.width * 0.5,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: TColor.primary,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        "assets/img/r_pause.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/img/r_lock.png",
                          width: 25,
                          height: 25,
                        ),
                        const Text(
                          "Unlock",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
