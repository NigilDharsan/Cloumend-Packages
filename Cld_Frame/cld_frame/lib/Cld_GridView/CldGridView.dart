import 'package:flutter/material.dart';

class CldGridView extends StatelessWidget {
  final int? itemCount;
  final int? crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final Widget? gridCardWidget;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  const CldGridView(
      {super.key,
        this.itemCount = 4,
        this.crossAxisCount = 2,
        this.crossAxisSpacing = 5.0,
        this.mainAxisSpacing = 5.0,
        this.childAspectRatio = (200 / 250),
        this.gridCardWidget,
        this.scrollDirection = Axis. vertical,
        this.physics = const NeverScrollableScrollPhysics(),
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        shrinkWrap: true,
        scrollDirection: scrollDirection,
        physics: physics,
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount ?? 0, // 2 columns
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio, // width / height ratio
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Center(
            child: gridCardWidget ??
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
          );
        },
      ),
    );
  }
}