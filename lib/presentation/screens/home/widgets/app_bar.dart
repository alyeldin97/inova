import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  String image;
  AppBarDelegate(this.image);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 400, // Set the height of the app bar
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            image,
            fit: BoxFit.cover,
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(
                    context); // Replace with your desired navigation action
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 300.h; // Set the maximum extent of the app bar

  @override
  double get minExtent => 100.h; // Set the minimum extent of the app bar

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
