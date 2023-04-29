import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/schedule/fitness_app/widgets/exercise_widget.dart';
import 'package:medita_patient/app/presentation/screens/schedule/fitness_app/widgets/line_chart_widget/line_chart_widget.dart';

class FitnessSectionScreen extends StatefulWidget {
  const FitnessSectionScreen({super.key});

  @override
  State<FitnessSectionScreen> createState() => _FitnessSectionScreenState();
}

class _FitnessSectionScreenState extends State<FitnessSectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [builaAppBar(context), const ExerciseWidget()],
      ),
    );
  }

  SliverAppBar builaAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorManager.error,
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      stretch: true,
      pinned: true,
      flexibleSpace: const FlexibleSpaceBar(
        background: LineChartWidget(),
      ),
      title: const Text('Statistics'),
      //  leading: const Icon(Icons.menu),
      actions: [
        IconButton(
          icon: const Icon(Icons.person, size: AppSize.s30),
          onPressed: () {},
        )
      ],
    );
  }
}
