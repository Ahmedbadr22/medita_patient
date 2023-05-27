import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/styles_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

import '../model/plant_model.dart';

class DetailsScreen extends StatefulWidget {
  final PlantModel plant;

  const DetailsScreen({Key? key, required this.plant}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height / 2.5,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.2),
                          blurRadius: AppSize.s15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(AppSize.s30),
                        bottomRight: Radius.circular(60),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(widget.plant.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.s20, vertical: AppSize.s20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.plant.plantName} Benfits:",
                          style: getBoldStyle(
                              color: ColorManager.lightBlack,
                              fontSize: AppMargin.m16),
                        ),
                        const SizedBox(height: AppSize.s20),
                        for (int i = 0;
                            i < widget.plant.description.length;
                            i++)
                          Column(
                            children: [
                              Text(
                                widget.plant.description[i].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: AppSize.s16,
                                  fontWeight: FontWeight.bold,
                                  height: 1.4,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: AppSize.s8),
                              Text(
                                widget.plant.description[i].substitute,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 15.0,
                                  height: 1.4,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: AppSize.s20),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.s24, vertical: AppSize.s10),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.3),
                        blurRadius: AppSize.s15,
                        offset: const Offset(0, -5),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppSize.s50),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                        isPressed ? Icons.favorite : Icons.favorite_border),
                    color: ColorManager.white,
                    iconSize: AppSize.s30,
                    onPressed: () {
                      isPressed = !isPressed;
                      setState(() {});
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
