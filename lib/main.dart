import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';
import 'features/on_boarding/presentation/bloc/cubit/page_swipe_cubit.dart';
import 'features/on_boarding/presentation/pages/boarding_pages/boarding_page1.dart';
import 'features/on_boarding/presentation/pages/boarding_pages/boarding_page2.dart';
import 'features/on_boarding/presentation/pages/boarding_pages/boarding_page3.dart';
import 'features/on_boarding/presentation/pages/boarding_pages/boarding_page4.dart';
import 'features/on_boarding/presentation/pages/boarding_pages/boarding_page5.dart';
import 'features/on_boarding/presentation/pages/boarding_pages/boarding_page6.dart';

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
      home: BlocProvider(
        create: (context) => PageSwipeCubit(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: PageController(initialPage: 0),
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                BlocProvider.of<PageSwipeCubit>(context).pageSwipe(value);
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
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
                            return BlocBuilder<PageSwipeCubit, int>(
                              builder: (context, state) {
                                return DottedBorder(
                                  borderType: BorderType.Circle,
                                  dashPattern: const [5],
                                  color: i == state
                                      ? kPrimaryColor
                                      : Colors.transparent,
                                  child: CircleAvatar(
                                    radius: i == state ? 9 : 7,
                                    backgroundColor: i == state
                                        ? kPrimaryColor
                                        : kSecondaryColor,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
