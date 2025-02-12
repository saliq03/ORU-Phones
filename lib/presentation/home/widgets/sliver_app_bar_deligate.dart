import 'package:flutter/cupertino.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  SliverAppBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 60.0; // Fixed height for each section
  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(covariant SliverAppBarDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}
