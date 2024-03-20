import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/language_row.dart';

class SelectLanguageView extends StatefulWidget {
  final Function(Map) didSelect;
  const SelectLanguageView({super.key, required this.didSelect });

  @override
  State<SelectLanguageView> createState() => _SelectLanguageViewState();
}

class _SelectLanguageViewState extends State<SelectLanguageView> {
  int selectIndex = 0;
  List langArr = [
    {"name": "English", },
    {"name": "Spanish", },
    {"name": "Hindi", },
    {"name": "Arabic",},
    {"name": "Portuguese", },
    {"name": "Bengali",},
    {"name": "Russian",},
    {"name": "Vietnamese",}
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
          "Language",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (context, index) {
            var tObj = langArr[index] as Map? ?? {};

            return LanguageRow(
                tObj: tObj,
                isActive: selectIndex == index  , onPressed: (){
                  setState(() {
                    selectIndex = index;
                  });
                },);
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black26,
              height: 1,
            );
          },
          itemCount: langArr.length),
      
    );
  }
}
