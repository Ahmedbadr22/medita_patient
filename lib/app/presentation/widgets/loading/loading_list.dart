import 'package:flutter/material.dart';
import 'package:medita_patient/app/app/extensions.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({
    Key? key,
    required this.shimmerItem,
    required this.itemCount,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
  }) : super(key: key);

  final Widget shimmerItem;
  final int itemCount;
  final Axis scrollDirection;
  final bool shrinkWrap;


  @override
  Widget build(BuildContext context) {
    Widget loadingItemBuilder(_, int index) {
      return shimmerItem;
    }

    SizedBox verticalSeparatorItemBuilder(_, int index) => AppSize.s5.ph;
    SizedBox horizontalSeparatorItemBuilder(_, int index) => AppSize.s5.pw;

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: loadingItemBuilder,
      shrinkWrap: shrinkWrap,
      separatorBuilder: scrollDirection == Axis.vertical ? verticalSeparatorItemBuilder : horizontalSeparatorItemBuilder,
      itemCount: itemCount,
      scrollDirection: scrollDirection,
    );
  }
}
