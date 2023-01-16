import 'package:boarding_screen/screens/boarding_pages/boarding_page1.dart';
import 'package:boarding_screen/screens/boarding_pages/boarding_page2.dart';
import 'package:boarding_screen/screens/boarding_pages/boarding_page3.dart';
import 'package:boarding_screen/screens/boarding_pages/boarding_page4.dart';
import 'package:boarding_screen/screens/boarding_pages/boarding_page5.dart';
import 'package:boarding_screen/screens/boarding_pages/boarding_page6.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'On Boarding Screen',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFBF5AF2),
          secondary: const Color(0xFFBF5AF2).withOpacity(0.48),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: PageView(
                  controller: PageController(initialPage: 0),
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  children: const [
                    BoardingPage1(),
                    BoardingPage2(),
                    BoardingPage3(),
                    BoardingPage4(),
                    BoardingPage5(),
                    BoardingPage6(),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DottedBorder(
                      borderType: BorderType.Circle,
                      dashPattern: const [5],
                      color: kPrimaryColor,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: kPrimaryColor,
                      ),
                    ),
                    for (int i = 0; i < 5; i++) ...[
                      DottedBorder(
                        borderType: BorderType.Circle,
                        dashPattern: const [5],
                        color: Colors.transparent,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: kSecondaryColor,
                        ),
                      ),
                      const SizedBox(width: 2),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
