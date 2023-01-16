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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: PageView(
                controller: PageController(initialPage: 0),
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  _page = value;
                  setState(() {});
                },
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
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints.expand(height: 22),
                      child: Center(
                        child: ListView.separated(
                          itemCount: 6,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 5,
                          ),
                          itemBuilder: (context, position) {
                            int i = position;
                            return DottedBorder(
                              borderType: BorderType.Circle,
                              dashPattern: const [5],
                              color: i == _page
                                  ? kPrimaryColor
                                  : Colors.transparent,
                              child: CircleAvatar(
                                radius: i == _page ? 9 : 7,
                                backgroundColor: i == _page
                                    ? kPrimaryColor
                                    : kSecondaryColor,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
          ],
        ),
      ),
    );
  }
}
