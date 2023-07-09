import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/border_button.dart';

class WeightView extends StatefulWidget {
  const WeightView({super.key});

  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {
  List myWeightArr = [
    {"name": "Sunday, AUG 19", "image": "assets/img/w_1.png"},
    {"name": "Sunday, AUG 26", "image": "assets/img/w_2.png"},
    {
      "name": "Sunday, AUG 26",
      "image": "assets/img/w_3.png",
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
          "Check your process",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: BorderButton(
                        title: "Check Process",
                        type: BorderButtonType.inactive,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: BorderButton(
                        title: "My Weight",
                        onPressed: () {},
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                "Add more photo to control your process",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                width: media.width,
                height: media.width * 0.9,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 0.5,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.65,
                      enlargeFactor: 0.4,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                  itemCount: myWeightArr.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int index) {
                    var dObj = myWeightArr[index] as Map? ?? {};
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
                      child: 
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(dObj["image"].toString(),
                                width: double.maxFinite,
                                height: double.maxFinite,
                                fit: BoxFit.cover),
                          ),
                         
                       
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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

            Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: 160,
        decoration: BoxDecoration(
            border: Border.all(color:  TColor.gray.withOpacity(0.5), width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
         "74 kg",
          textAlign: TextAlign.center,
          style: TextStyle(color:  TColor.primary , fontSize: 24, fontWeight: FontWeight.w700 ),
        ),
      ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                "   Lore ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et  dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.m ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget lorem dolor sed viverra ipsum nunc aliquet. Hendrerit  gravida rutrum quisque non tellus orci ac. Adipiscing at in tellus integer feugiat scelerisque varius. Quam pellentesque nec nam aliquam sem et tortorconsequat id. Orci eu lobortis elementum nibh tellus molestie nunc non blandit. Dolor morbi non arcu risus quis varius. Magna eget est lorem ipsum dolor sit amet. Ante metus dictum at tempor commodo ullamcorper a lacus. Diam in arcu cursus euismod. Nulla at volutpat diam ut venenatis tellus in metus vulputate. Tempor nec feugiat nisl pretium fusce id velit ut. \n\nFelis eget velit aliquet sagittis id consectetur. Pretium lectus quam id leo in vitae. Eget nunc lobortis mattis aliquam faucibus purus. Aliquet sagittis id consectetur purus. Odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus. Donec et odio pellentesque diam volutpat commodo sed egestas. Commodo nulla facilisi nullam vehicula ipsum. Quisque egestas diam in arcu cursus euismod. Et malesuada fames ac turpis egestas sed tempus. Quam viverra orci sagittis eu volutpat. Imperdiet dui accumsan sit amet nulla facilisi morbi tempus. Quis ipsum suspendisse ultrices gravida. Nibh tellus molestie nunc non blandit massa enim nec. Adipiscing enim eu turpis egestas pretium aenean. Sem integer vitae justo eget magna fermentum iaculis eu non.",
                style: TextStyle(color: TColor.secondaryText, fontSize: 16),
              ),
            ),
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
