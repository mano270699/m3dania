import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 1000;

    return SafeArea(
      child: Flex(direction: Axis.vertical, children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey.shade300,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          color: Colors.grey,
                        ),
                      ),
                      period: Duration(milliseconds: time),
                    )),
                Container(
                  height: 100,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      offset += 5;
                      time = 800 + offset;

                      print(time);

                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Shimmer.fromColors(
                            highlightColor: Colors.white,
                            baseColor: Colors.grey.shade300,
                            child: ShimmerLayout(),
                            period: Duration(milliseconds: time),
                          ));
                    },
                  ),
                ),
                Container(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      offset += 5;
                      time = 800 + offset;

                      print(time);

                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Shimmer.fromColors(
                            highlightColor: Colors.white,
                            baseColor: Colors.grey.shade300,
                            child: ShimmerLayoutCard(),
                            period: Duration(milliseconds: time),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width - 305;
    double containerHeight = 15;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth - 25,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
            ],
          )
        ],
      ),
    );
  }
}

class ShimmerLayoutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.grey,
      ),
    );
  }
}
