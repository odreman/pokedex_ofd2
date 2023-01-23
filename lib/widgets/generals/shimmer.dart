import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerBerryItem() {
  int time = 1000;

  return Shimmer.fromColors(
      highlightColor: Colors.grey.shade100,
      baseColor: Colors.grey.shade300,
      period: Duration(milliseconds: time),
      child: shimmerContainerBerryItem());
}

Widget shimmerPokemonSwiper() {
  int time = 1000;

  return Shimmer.fromColors(
      highlightColor: Colors.grey.shade100,
      baseColor: Colors.grey.shade300,
      period: Duration(milliseconds: time),
      child: shimmerContainerPokemonSwiper());
}

Widget shimmerMove() {
  int time = 1000;

  return Shimmer.fromColors(
      highlightColor: Colors.grey.shade100,
      baseColor: Colors.grey.shade300,
      period: Duration(milliseconds: time),
      child: shimmerContainerMove());
}

Widget shimmerDetails() {
  int time = 1000;

  return Shimmer.fromColors(
      highlightColor: Colors.grey.shade100,
      baseColor: Colors.grey.shade300,
      period: Duration(milliseconds: time),
      child: shimmerContainerDetails());
}

Widget shimmerContainerPokemonSwiper() {
  return SizedBox(
    child: Column(children: [
      image3(),
      space2(),
      title5(),
      space(),
      title4(),
      space(),
      title3(),
    ]),
  );
}

Widget shimmerContainerBerryItem() {
  return Container(
    margin: const EdgeInsets.only(left: 10, top: 30),
    child: Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: image(),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                space(),
                line(),
                space(),
                line(),
              ],
            )
          ],
        ),
        space2(),
        title(),
        space1(),
        line(),
        space1(),
        line(),
        space1(),
        line(),
        space2(),
        title(),
        space1(),
        line(),
        space1(),
        line(),
        space1(),
        line(),
        space2(),
        title(),
        space1(),
        line(),
        space1(),
        line(),
        space1(),
        line(),
        space2(),
        title(),
        space1(),
        line(),
        space1(),
        line(),
        space1(),
        line(),
      ],
    ),
  );
}

Widget shimmerContainerDetails() {
  return Container(
    margin: const EdgeInsets.only(left: 20, top: 150, right: 30),
    child: Column(
      children: [
        title2(),
        space2(),
        title(),
        space1(),
        title(),
        space2(),
        Align(
          alignment: Alignment.topRight,
          child: image2(),
        ),
        space2(),
        title3(),
        space1(),
        line(),
        space1(),
        line(),
        space1(),
        line(),
        space2(),
        title3(),
        space1(),
        line(),
        space1(),
        line(),
        space1(),
        line(),
        space2(),
        title3(),
        space1(),
        line(),
        space1(),
        line(),
        space1(),
        line(),
      ],
    ),
  );
}

Widget shimmerContainerMove() {
  return Container(
    margin: const EdgeInsets.only(left: 10, top: 30),
    child: Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: image(),
        ),
        space1(),
        line(),
        space1(),
        line(),
        space2(),
        title2(),
        space1(),
        title2(),
        space2(),
        title2(),
        space1(),
        title2(),
        space1(),
        title2(),
        space1(),
        title2(),
      ],
    ),
  );
}

Widget image() {
  return Container(
    height: 40,
    width: 160,
    color: Colors.grey.shade300,
  );
}

Widget image2() {
  return Container(
    height: 100,
    width: 160,
    color: Colors.grey.shade300,
  );
}

Widget image3() {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        height: 210,
        width: 270,
        color: Colors.grey.shade300,
      ),
    ),
  );
}

Widget space2() {
  return const SizedBox(
    height: 40,
  );
}

Widget space1() {
  return const SizedBox(
    height: 10,
  );
}

Widget space() {
  return const SizedBox(
    height: 5,
  );
}

Widget title() {
  double containerHeight = 15;
  double containerWidth = 100;
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
        height: containerHeight,
        width: containerWidth,
        color: Colors.grey.shade300),
  );
}

Widget title3() {
  double containerHeight = 15;
  double containerWidth = 100;
  return Align(
    alignment: Alignment.center,
    child: Container(
        height: containerHeight,
        width: containerWidth,
        color: Colors.grey.shade300),
  );
}

Widget title4() {
  double containerHeight = 30;
  double containerWidth = 200;
  return Align(
    alignment: Alignment.center,
    child: Container(
        height: containerHeight,
        width: containerWidth,
        color: Colors.grey.shade300),
  );
}

Widget title5() {
  double containerHeight = 30;
  double containerWidth = 160;
  return Align(
    alignment: Alignment.center,
    child: Container(
        height: containerHeight,
        width: containerWidth,
        color: Colors.grey.shade300),
  );
}

Widget line() {
  double containerHeight = 15;
  double containerWidth = 170;
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
        height: containerHeight,
        width: containerWidth * 2,
        color: Colors.grey.shade300),
  );
}

Widget title2() {
  double containerHeight = 15;
  double containerWidth = 160;
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
        height: containerHeight,
        width: containerWidth,
        color: Colors.grey.shade300),
  );
}
