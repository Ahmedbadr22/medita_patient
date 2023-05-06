import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/font_manager.dart';
import 'package:medita_patient/app/presentation/manager/styles_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/schedule/plants_app/data/oil_data.dart';
import 'package:medita_patient/app/presentation/screens/schedule/plants_app/data/plant_data.dart';
import 'package:medita_patient/app/presentation/screens/schedule/plants_app/model/plant_model.dart';
import 'package:medita_patient/app/presentation/screens/schedule/plants_app/screens/plant_details.dart';

class PlantScreen extends StatefulWidget {
  const PlantScreen({Key? key}) : super(key: key);

  @override
  State<PlantScreen> createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  PageController controller = PageController();
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.6, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Medicinal Herbs and Plants'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: AppSize.s20, top: AppSize.s20),
              child: Text(
                'Medicinal Herbs and Plants:',
                style: getMediumStyle(
                    color: ColorManager.lightBlack, fontSize: FontSize.s18),
              ),
            ),
            SizedBox(
              height: 320.0,
              child: PageView.builder(
                itemCount: plantData.length,
                controller: controller,
                physics: const BouncingScrollPhysics(),
                padEnds: false,
                pageSnapping: true,
                onPageChanged: (value) => setState(() => activePage = value),
                itemBuilder: (itemBuilder, index) {
                  bool active = index == activePage;
                  return slider(active, plantData[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s20),
              child: Text(
                'Treatment with natural oils:',
                style: getMediumStyle(
                    color: ColorManager.lightBlack, fontSize: FontSize.s18),
              ),
            ),
            SizedBox(
              height: 320.0,
              child: PageView.builder(
                itemCount: oilData.length,
                controller: controller,
                physics: const BouncingScrollPhysics(),
                padEnds: false,
                pageSnapping: true,
                onPageChanged: (value) => setState(() => activePage = value),
                itemBuilder: (itemBuilder, index) {
                  bool active = index == activePage;
                  return slider(active, oilData[index]);
                },
              ),
            ),
            const SizedBox(height: AppSize.s30)
          ],
        ),
      ),
    );
  }

  AnimatedContainer slider(active, PlantModel plantData) {
    double margin = active ? AppSize.s20 : AppSize.s30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: mainPlantsCard(plantData: plantData),
    );
  }

  Widget mainPlantsCard({required PlantModel plantData}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => DetailsScreen(plant: plantData),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(AppSize.s8),
        decoration: BoxDecoration(
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
          ],
          border: Border.all(color: Colors.green.withOpacity(.5), width: 2),
          borderRadius: BorderRadius.circular(AppSize.s30),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(AppSize.s5, AppSize.s5),
                  ),
                ],
                borderRadius: BorderRadius.circular(AppSize.s25),
                image: DecorationImage(
                  image: NetworkImage(plantData.baseImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppSize.s5),
                child: Text(
                  plantData.plantName,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.s16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int selectId = 0;
  int activePage = 0;
}
