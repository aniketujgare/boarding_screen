import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants.dart';

const String image = 'assets/images/Tasks.png';
const String caption =
    'Refer other stores to avail cashbacks \nyourself.\n\nCustomers don’t get to have all the fun.';
double height = 601;
int page = 4;

class BoardingPage4 extends StatelessWidget {
  const BoardingPage4({super.key});

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.1348,
        ),
        Expanded(
          flex: 3,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: height * 0.03),
        Expanded(
          flex: 4,
          child: FittedBox(
            alignment: Alignment.topCenter,
            fit: BoxFit.scaleDown,
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
      ],
    );
  }
}

class HorizontalView extends StatelessWidget {
  const HorizontalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  image,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
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
        SizedBox(height: height * 0.2),
      ],
    );
  }
}
