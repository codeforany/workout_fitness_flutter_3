import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:workout_fitness/common_widget/round_button.dart';

import '../../common/color_extension.dart';
import '../../common_widget/exercises_row.dart';
import '../workout/workout_view.dart';
import '../workout/workout_view_2.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List dataArr = [
    {
      "name": "Running",
      "image": "assets/img/2.png",
    },
    {
      "name": "Push-Up",
      "image": "assets/img/3.png",
    },
    {
      "name": "Leg Extension",
      "image": "assets/img/5.png",
    }
  ];

  List trainingDayArr = [
    {
      "name": "Training Day 1",
    },
    {
      "name": "Training Day 2",
    },
    {
      "name": "Training Day 3",
    }
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
          "Fitness Application",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                width: media.width,
                height: media.width * 0.4,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 0.5,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.65,
                      enlargeFactor: 0.4,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                  itemCount: dataArr.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int index) {
                    var dObj = dataArr[index] as Map? ?? {};
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2)),
                          ]),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(dObj["image"].toString(),
                                width: double.maxFinite,
                                height: double.maxFinite,
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              dObj["name"].toString(),
                              style: TextStyle(
                                  color: TColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                width: media.width,
                height: media.width * 1.1,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 0.6,
                      enlargeCenterPage: true,
                      viewportFraction: 0.85,
                      enableInfiniteScroll: false,
                      enlargeFactor: 0.4,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                  itemCount: trainingDayArr.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int index) {
                    var tObj = trainingDayArr[index] as Map? ?? {};
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2)),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            tObj["name"].toString(),
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "week 1",
                            style: TextStyle(
                                color: TColor.secondaryText.withOpacity(0.8),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          ExercisesRow(
                              number: "1",
                              title: "Exercises 1",
                              time: "7 min",
                              isActive: true,
                              onPressed: () {}),
                          ExercisesRow(
                              number: "2",
                              title: "Exercises 2",
                              time: "15 min",
                              onPressed: () {}),
                          ExercisesRow(
                              number: "3",
                              title: "Finished",
                              time: "5 min",
                              isLast: true,
                              onPressed: () {}),
                          const Spacer(),
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: RoundButton(
                                title: "Start",
                                onPressed: () {
                                  if (index % 2 == 0) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WorkoutView()));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WorkoutView2()));
                                  }
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
