import 'package:flutter/material.dart';

import '../../manager/color_manager.dart';

class FakeSearchButton extends StatelessWidget {
  const FakeSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: ColorManager.gray.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Row(
                children: const <Widget> [
                  Icon(Icons.search),
                  SizedBox(width: 10,),
                  Text("Search")
                ],
              ),
              const Icon(Icons.filter_list)
            ],
          ),
        ),
      ),
      onTap: (){},
    );
  }
}
