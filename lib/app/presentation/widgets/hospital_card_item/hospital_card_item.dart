import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import '../../manager/values_manager.dart';

class HospitalCardItem extends StatelessWidget {
  const HospitalCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Card(
        elevation: AppSize.s0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
                  child: Image.network(
                    "https://www.templehealth.org/sites/default/files/styles/full_width_image/public/temple-university-hospital-jeanes-campus-entrance-1.jpg?itok=51S1CrQd",
                    height: AppSize.s120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: AppSize.s16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringManager.hospitalName,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite, color: Theme.of(context).primaryColor,),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: const [
                          Chip(label: Text("Dental"))
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star_half),
                          SizedBox(width: AppSize.s5,),
                          Text("4.3"),
                          SizedBox(width: AppSize.s5,),
                          Text("(5,376 reviews)"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
