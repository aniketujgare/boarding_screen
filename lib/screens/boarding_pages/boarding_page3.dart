import 'package:boarding_screen/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String image = 'assets/images/Call Service.png';
const String caption =
    'Finding enough customers for your store sucks,\nand you have a business to run.\n\nWe’re here to help.';
double height = 601;
int page = 3;

class BoardingPage3 extends StatelessWidget {
  const BoardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait && height > 600) {
          return const VerticalView();
        } else {
          return const HorizontalView();
        }
      },
    );
  }
}

class VerticalView extends StatelessWidget {
  const VerticalView({super.key});

  @override
  Widget build(BuildContext context) {
    double inactiveSize = 7;
    double activeSize = 9;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.1348,
        ),
        Expanded(
          flex: 4,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: FittedBox(
              alignment: Alignment.topCenter,
              fit: BoxFit.contain,
              child: Text(
                caption,
                textAlign: TextAlign.center,
                style: GoogleFonts.dosis(
                  height: 1.6,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: kTextColor,
                ),
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 1; i <= 6; i++) ...[
                DottedBorder(
                  borderType: BorderType.Circle,
                  dashPattern: const [5],
                  color: i == page + 1 ? kPrimaryColor : Colors.transparent,
                  child: CircleAvatar(
                    radius: i == page + 1 ? activeSize : inactiveSize,
                    backgroundColor:
                        i == page + 1 ? kPrimaryColor : kSecondaryColor,
                  ),
                ),
                const SizedBox(width: 2),
              ]
            ],
          ),
        ),
        SizedBox(
          height: height * 0.1348,
        ),
      ],
    );
  }
}

class HorizontalView extends StatelessWidget {
  const HorizontalView({super.key});

  @override
  Widget build(BuildContext context) {
    double inactiveSize = 7;
    double activeSize = 9;

    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  image,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          caption,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dosis(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: kTextColor,
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
                  radius: activeSize,
                  backgroundColor: kPrimaryColor,
                ),
              ),
              for (int i = 0; i < 5; i++)
                DottedBorder(
                  borderType: BorderType.Circle,
                  dashPattern: const [5],
                  color: Colors.transparent,
                  child: CircleAvatar(
                    radius: inactiveSize,
                    backgroundColor: kSecondaryColor,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
