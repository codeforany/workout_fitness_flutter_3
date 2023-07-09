import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import '../../common/color_extension.dart';
import 'package:intl/intl.dart' show DateFormat;

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  DateTime nowTime = DateTime.now();
  DateTime targetDate = DateTime.now();
  List dateArr = [
    DateTime(2023, 7, 2),
    DateTime(2023, 7, 14),
  ];
  List notArr = [
    {
      "day": "2",
      "detail":
          " You exercise 40 minutes a day and five days a week at a certain time, you practice on a regular schedule. Changing the schedule will result in diminished results, resulting in fatigue."
    },
    {
      "day": "14",
      "detail":
          "Tips for weight loss work towards functional exercises, proven strength and balance, and reduced risk of injury when muscle groups are active at the same time."
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        centerTitle: true,
        elevation: 0.1,
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
          "Schedule",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.MMMM().format(targetDate).toUpperCase(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            DateFormat.y().format(targetDate),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          targetDate =
                              DateTime(targetDate.year, targetDate.month - 1);
                        });
                      },
                      icon: Image.asset(
                        "assets/img/black_fo.png",
                        width: 15,
                        height: 15,
                        color: TColor.secondaryText.withOpacity(0.7),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          targetDate =
                              DateTime(targetDate.year, targetDate.month + 1);
                        });
                      },
                      icon: Image.asset(
                        "assets/img/next_go.png",
                        width: 15,
                        height: 15,
                        color: TColor.secondaryText.withOpacity(0.7),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Stack(
                children: [
                  CalendarCarousel(
                    todayButtonColor: TColor.primary,
                    todayBorderColor: TColor.primary,
                    selectedDayButtonColor: TColor.primary,
                    selectedDayBorderColor: TColor.primary,
                    onDayPressed: (DateTime date, List events) {
                      // this.setState(() => nowTime = date);
                    },
                    onCalendarChanged: (date) {
                      setState(() {
                        targetDate = date;
                      });
                    },
                    selectedDayTextStyle: TextStyle(
                        color: TColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    daysTextStyle: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    weekDayFormat: WeekdayFormat.narrow,
                    weekdayTextStyle:  TextStyle(
                        color: TColor.gray,
                        fontSize: 20),
                    weekendTextStyle: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                   
                    thisMonthDayBorderColor: Colors.transparent,
                    showHeader: false,
                    customDayBuilder: (
                      /// you can provide your own build function to make custom day containers
                      bool isSelectable,
                      int index,
                      bool isSelectedDay,
                      bool isToday,
                      bool isPrevMonthDay,
                      TextStyle textStyle,
                      bool isNextMonthDay,
                      bool isThisMonthDay,
                      DateTime day,
                    ) {
                      var selectObj = dateArr.firstWhere(
                          (eDate) =>
                              day.day == eDate.day &&
                              day.month == eDate.month &&
                              day.year == eDate.year,
                          orElse: () => null);

                      if (selectObj != null) {
                        return Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: Text(
                            day.day.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        );
                      }
                      // dateArr

                      // if (day.day == 15) {
                      //   return Center(
                      //     child: Icon(Icons.local_airport),
                      //   );
                      // } else {
                      //   return null;
                      // }
                    },
                    weekFormat: false,

                    height: 340.0,
                    selectedDateTime: nowTime,
                    targetDateTime: targetDate,
                    daysHaveCircularBorder: true,

                    /// null for not rendering any border, true for circular border, false for rectangular border
                  ),

                 const Padding(
                   padding:  EdgeInsets.only(top: 33),
                   child:  Divider(color:  Colors.black26, height: 1, ),
                 )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                "Note",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                shrinkWrap: true,
                itemCount: notArr.length,
                itemBuilder: (context, index) {
                  var iObj = notArr[index] as Map? ?? {};

                  return Container(
                    padding: const EdgeInsets.only(bottom: 15, left: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: Text(
                            iObj["day"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Text(
                          iObj["detail"],
                          style: TextStyle(
                              color: TColor.secondaryText, fontSize: 16),
                        ))
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_running.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_meal_plan.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_home.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_weight.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child:
                    Image.asset("assets/img/more.png", width: 25, height: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
