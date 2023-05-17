import 'package:flutter/material.dart';

import '../../../manager/color_manager.dart';

class TimeChip extends StatelessWidget {
  const TimeChip({
    Key? key,
    required this.time,
    required this.isSelected,
    this.onClick,
  }) : super(key: key);

  final String time;
  final bool isSelected;
  final Function(bool)? onClick;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      label: Text(
        time,
        style: TextStyle(
          color: isSelected ? Colors.white : ColorManager.lightBlue,
        ),
      ),
      onSelected: onClick,
      backgroundColor: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
      shape: StadiumBorder(
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1.5,
        ),
      ),
    );
  }
}
