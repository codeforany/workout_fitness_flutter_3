import 'package:flutter/material.dart';
import 'package:workout_fitness/view/workout/workout_detail_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/tab_button.dart';

class ExerciseView2 extends StatefulWidget {
  const ExerciseView2({super.key});

  @override
  State<ExerciseView2> createState() => _ExerciseView2State();
}

class _ExerciseView2State extends State<ExerciseView2> {
  int isActiveTab = 0;
  List workArr = [
    {"name": "Push-Up", "image": "assets/img/1.png"},
    {"name": "Leg extenstion", "image": "assets/img/2.png"},
    {
      "name": "Push-Up",
      "image": "assets/img/5.png",
    },
    {
      "name": "Climber",
      "image": "assets/img/3.png",
    },
  ];

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
          "Exercise",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(color: TColor.white, boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
          ]),
          child: Row(
            children: [
              Expanded(
                flex:3,
                child: TabButton2(
                  title: "Full Body",
                  isActive: isActiveTab == 0,
                  onPressed: () {
                    setState(() {
                      isActiveTab = 0;
                    });
                  },
                ),
              ),
              Expanded(
                 flex: 2,
                child: TabButton2(
                  title: "Foot",
                  isActive: isActiveTab == 1,
                  onPressed: () {
                    setState(() {
                      isActiveTab = 1;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: TabButton2(
                  title: "Arm",
                  isActive: isActiveTab == 2,
                  onPressed: () {
                    setState(() {
                      isActiveTab = 2;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: TabButton2(
                  title: "Body",
                  isActive: isActiveTab == 3,
                  onPressed: () {
                    setState(() {
                      isActiveTab = 3;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: workArr.length,
              itemBuilder: (context, index) {
                var wObj = workArr[index] as Map? ?? {};
                return Container(
                  decoration: BoxDecoration(color: TColor.white),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            wObj["image"].toString(),
                            width: media.width,
                            height: media.width * 0.55,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: media.width,
                            height: media.width * 0.55,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Image.asset(
                            "assets/img/play.png",
                            width: 60,
                            height: 60,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              wObj["name"],
                              style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const WorkoutDetailView()));
                                },
                                icon: Image.asset("assets/img/more.png",
                                    width: 25, height: 25))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ]),
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
