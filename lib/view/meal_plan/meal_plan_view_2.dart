import 'package:flutter/material.dart';
import 'package:workout_fitness/view/workout/workout_detail_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/tab_button.dart';

class MealPlanView2 extends StatefulWidget {
  const MealPlanView2({super.key});

  @override
  State<MealPlanView2> createState() => _MealPlanView2State();
}

class _MealPlanView2State extends State<MealPlanView2> {
  int isActiveTab = 0;
  List workArr = [
    {"name": "Breafast", "title":"vegetable, Sandwich", "image": "assets/img/f1.png"},
    {"name": "Snack", "title": "Boat, nut, butter", "image": "assets/img/f2.png"},
    {
      "name": "Breafast",
      "title": "vegetable, Sandwich",
      "image": "assets/img/f3.png",
    },
    {
      "name": "Snack",
       "title": "Boat, nut, butter",
      "image": "assets/img/f4.png",
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
          "Meal Plan",
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
               
                child: TabButton2(
                  title: "Water",
                  isActive: isActiveTab == 0,
                  onPressed: () {
                    setState(() {
                      isActiveTab = 0;
                    });
                  },
                ),
              ),
              Expanded(
                
                child: TabButton2(
                  title: "Food",
                  isActive: isActiveTab == 1,
                  onPressed: () {
                    setState(() {
                      isActiveTab = 1;
                    });
                  },
                ),
              ),
             
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/img/black_fo.png",
                  width: 20,
                  height: 20,
                ),
              ),
              Expanded(
                child: Text(
                  "Sunday, AUG 26",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/img/next_go.png",
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              itemCount: workArr.length,
              itemBuilder: (context, index) {
                var wObj = workArr[index] as Map? ?? {};
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(color: TColor.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          wObj["image"].toString(),
                          width: media.width,
                          height: media.width * 0.55,
                          fit: BoxFit.cover,
                        ),
                      ),
                          
                       
                       Text(
                        wObj["name"],
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),

                      Text(
                        wObj["title"],
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14),
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
