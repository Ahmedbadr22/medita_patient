import 'package:flutter/material.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/widgets/fake_search_button/fake_search_button.dart';
import 'package:medita_patient/app/presentation/widgets/home_card/home_card.dart';
import 'package:medita_patient/app/presentation/widgets/section_header/section_header.dart';
import 'package:medita_patient/app/presentation/widgets/speciality_button/speciality_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../manager/color_manager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageController pageController = PageController();

    List<String> doctorSpeciality= ["All", "General", "Dentist", "Nutritionist", "Pediatric"];

    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppSize.s16,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://lovehairstyles.com/wp-content/uploads/2022/05/tp-best-mens-hairstyles.jpg"),
              radius: AppSize.s25,
            ),
            const SizedBox(width: AppSize.s10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Text>[
                Text(
                  StringManager.goodMorning,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Text("Ahmed Badr"),
              ],
            ),
          ],
        ),
        actions: <IconButton>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: FakeSearchButton(),
            ),
            Stack(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: AppSize.s200,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const HomeCard();
                    },
                  ),
                ),
                Positioned(
                  bottom: AppSize.s20,
                  right: (size.width / 2) - (16 * 2),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotWidth: 6,
                      dotHeight: 6,
                      activeDotColor: ColorManager.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    const SectionHeader(title: StringManager.doctorSpeciality, buttonText: StringManager.seeAll),
                    const SizedBox(height: AppSize.s10,),
                    SizedBox(
                      height: AppSize.s200,
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 4,
                        children: const <SpecialityButton>[
                          SpecialityButton(title: 'General', icon: Icons.person),
                          SpecialityButton(title: 'Dentist', icon: Icons.network_wifi),
                          SpecialityButton(title: 'Ophthal..', icon: Icons.remove_red_eye),
                          SpecialityButton(title: 'Nutrition..', icon: Icons.apple),
                          SpecialityButton(title: 'Neurolo..', icon: Icons.confirmation_num_rounded),
                          SpecialityButton(title: 'Pediatic', icon: Icons.child_friendly),
                          SpecialityButton(title: 'Radiolo..', icon: Icons.width_full),
                          SpecialityButton(title: 'More', icon: Icons.more_horiz),
                        ],
                      ),
                    ),
                    const SectionHeader(title: StringManager.topDoctors, buttonText: StringManager.seeAll),
                    SizedBox(
                      height: AppSize.s50,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: doctorSpeciality.length,
                        itemBuilder: (_, int index) {
                          var name = doctorSpeciality[index];
                          return FilterChip(
                            label: Text(name, style: TextStyle(color: index == 0 ? Colors.white : Colors.black),), onSelected: (bool value) {  },
                            backgroundColor: index == 0 ? Theme.of(context).primaryColor : Colors.transparent,
                            shape: StadiumBorder(side: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
                          );
                        },
                        separatorBuilder: (_, __) {
                          return const SizedBox(width: AppSize.s10,);
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: AppSize.s70,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s20), // adjust to your liking
            topRight: Radius.circular(AppSize.s20), // adjust to your liking
          ),
          color: ColorManager.white, // put the color here
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: StringManager.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: StringManager.appointments,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: StringManager.schedule,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              label: StringManager.articles,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: StringManager.profile,
            ),
          ],
        ),
      ),
    );
  }
}
