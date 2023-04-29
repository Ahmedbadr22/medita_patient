import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/widgets/text_input_field/main_text_input_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DateTime? _myDateTime;
  String gender = 'Genger';
  String language = '';
  String birthDate = 'Birth Date';
  File? file;
  Future _pickImage(bool imageFrom) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final temporaryImage = File(image.path);
      setState(() {});
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(title: const Text(StringManager.editProfile)),
      body: ListView(
        children: [
          file != null
              ? CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  radius: AppSize.s80,
                  backgroundImage: Image.file(file!).image)
              : _showCirclerImage(),
          Form(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s18),
                  child: Column(children: [
                    const SizedBox(height: AppSize.s14),
                    const MainTextInputField(
                        hint: 'Andrew Ainsley',
                        textInputType: TextInputType.name),
                    const SizedBox(height: AppSize.s14),
                    const MainTextInputField(
                        hint: 'Andrew', textInputType: TextInputType.name),
                    const SizedBox(height: AppSize.s14),
                    MainTextInputField(
                        hint: birthDate,
                        textInputType: TextInputType.datetime,
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today_outlined),
                            iconSize: AppSize.s16,
                            color: ColorManager.darkBlack,
                            onPressed: () async {
                              _myDateTime = await showDatePicker(
                                  context: context,
                                  initialDate: _myDateTime == null
                                      ? DateTime.now()
                                      : _myDateTime!,
                                  firstDate: DateTime(2010),
                                  lastDate: DateTime(2025));
                              setState(() {
                                birthDate = DateFormat('dd-MM-yyyy')
                                    .format(_myDateTime!);
                              });
                            })),
                    const SizedBox(height: AppSize.s14),
                    const MainTextInputField(
                        hint: 'Email',
                        textInputType: TextInputType.emailAddress,
                        suffixIcon: Icon(Icons.email, size: AppSize.s20)),
                    const SizedBox(height: AppSize.s14),
                    MainTextInputField(
                        hint: language,
                        suffixIcon: PopupMenuButton(
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            iconSize: AppSize.s40,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s15)),
                            itemBuilder: (context) {
                              return <PopupMenuEntry<String>>[
                                const PopupMenuItem(
                                    value: 'egypt', child: Text('Egypt')),
                                const PopupMenuItem(
                                    value: 'united states',
                                    child: Text('United States'))
                              ];
                            },
                            onSelected: (value) {
                              setState(() {
                                language = value;
                              });
                            })),
                    Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: AppSize.s14),
                        child: IntlPhoneField(
                            disableLengthCheck: true,
                            decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide())),
                            initialCountryCode: 'IN',
                            onChanged: (phone) {})),
                    const SizedBox(height: AppSize.s14),
                    MainTextInputField(
                        hint: gender,
                        suffixIcon: PopupMenuButton(
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            iconSize: AppSize.s40,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s15)),
                            itemBuilder: (context) {
                              return <PopupMenuEntry<String>>[
                                const PopupMenuItem(
                                    value: 'male', child: Text('Male')),
                                const PopupMenuItem(
                                    value: 'female', child: Text('Female')),
                              ];
                            },
                            onSelected: (value) {
                              setState(() {
                                gender = value;
                              });
                            }))
                  ]))),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.all(AppSize.s14),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: AppSize.s0,
                      padding: const EdgeInsets.all(AppSize.s14),
                      shape: const StadiumBorder()),
                  child: Text(StringManager.update,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: ColorManager.white))))
        ],
      ),
    );
  }

  showImageSource(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    _pickImage(true);
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                  onTap: () {
                    _pickImage(false);
                    Navigator.pop(context);
                  })
            ]));
  }

  Widget _showCirclerImage() {
    return Stack(alignment: Alignment.center, children: [
      CircleAvatar(
        backgroundColor: Colors.grey[100],
        radius: AppSize.s80,
        child: Icon(Icons.person, size: AppSize.s100, color: Colors.grey[300]),
      ),
      Positioned(
          right: 110,
          bottom: 10,
          child: IconButton(
              onPressed: () {
                showImageSource(context);
              },
              icon: buildCircle(
                  all: 3,
                  color: ColorManager.white,
                  child: buildCircle(
                      child: const Icon(Icons.edit,
                          color: ColorManager.white, size: AppSize.s20),
                      all: 4,
                      color: ColorManager.lightBlue))))
    ]);
  }
}

Widget buildCircle({
  required Widget child,
  required double all,
  required Color color,
}) =>
    ClipOval(
        child: Container(
      padding: EdgeInsets.all(all),
      color: color,
      child: child,
    ));
