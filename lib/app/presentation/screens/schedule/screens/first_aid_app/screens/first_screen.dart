import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/schedule/screens/first_aid_app/screens/tips_screen.dart';

import '../data/first_aid_data.dart';

class FirstAidSectionScreen extends StatefulWidget {
  const FirstAidSectionScreen({super.key});

  @override
  State<FirstAidSectionScreen> createState() => _FirstAidSectionScreenState();
}

class _FirstAidSectionScreenState extends State<FirstAidSectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Aid tips:')),
      body: ListView(children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: firstAidData.length,
            itemBuilder: (context, index) => tipWidget(index))
      ]),
    );
  }

  Widget tipWidget(int index) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              TipsScreen(firstAidModel: firstAidData[index]))),
      child: Container(
        padding: const EdgeInsets.all(AppSize.s16),
        margin: const EdgeInsets.symmetric(
            horizontal: AppSize.s16, vertical: AppSize.s10),
        decoration: BoxDecoration(
            color: firstAidData[index].color,
            borderRadius: BorderRadius.circular(AppSize.s16)),
        child: Row(
          children: [
            Expanded(flex: 3, child: buildText(index)),
            Expanded(child: Image.asset(firstAidData[index].imageUrl))
          ],
        ),
      ),
    );
  }

  Widget buildText(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstAidData[index].name,
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: AppSize.s10),
        Text(
          firstAidData[index].subtitle,
        )
      ],
    );
  }
}
