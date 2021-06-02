import 'package:flutter/material.dart';
// import 'package:jamal_v1/main.dart';
import 'package:jamal_v1/ui/do_workout.dart';
import 'package:jamal_v1/ui/forums.dart';
import 'package:jamal_v1/ui/home_page.dart';
import 'package:jamal_v1/ui/measurements.dart';
import 'package:jamal_v1/ui/settings.dart';

class BottomFeaturesBar extends StatelessWidget {
  final List<BottomIcon> bottomIcons = [
    BottomIcon("assets/icons/graph.png", "Progress", HomePage()),
    BottomIcon("assets/icons/measurements.png", "Track", AddMeasurements()),
    BottomIcon("assets/icons/add.png", "Add", DoWorkout()),
    BottomIcon("assets/icons/forums.png", "Forums", ForumsPage()),
    BottomIcon("assets/icons/settings.png", "Settings", Settings()),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final icon in bottomIcons)
              FittedBox(
                child: FeatureIcon(
                  img: icon.imgLocation,
                  title: icon.title,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => icon.page,
                      ),
                    );
                  },
                ),
              ),
          ],
        ));
  }
}

class FeatureIcon extends StatelessWidget {
  final String img;
  final String title;
  final Function press;
  // final bool isActive;

  const FeatureIcon({
    Key key,
    this.img,
    this.title,
    this.press,
    // this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            child: Image.asset(img),
          ),
          Text(title),
        ],
      ),
    );
  }
}

class BottomIcon {
  final String imgLocation;
  final String title;
  final Object page;

  BottomIcon(this.imgLocation, this.title, this.page);
}
