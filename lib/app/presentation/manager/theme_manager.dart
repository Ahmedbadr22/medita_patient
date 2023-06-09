import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/font_manager.dart';
import 'package:medita_patient/app/presentation/manager/styles_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';

ThemeData getApplicationLightTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.lightBlue,
    primaryColorDark: ColorManager.darkBlue,
    // disabledColor: ColorManager.gray,
    scaffoldBackgroundColor: ColorManager.darkWhite,
    backgroundColor: ColorManager.white,
    // card theme
    cardTheme: _getLightCardTheme(),
    // app bar theme
    appBarTheme: _getLightAppBarTheme(),
    // elevated button theme
    elevatedButtonTheme: _getElevatedButtonTheme(),
    // outlined button
    outlinedButtonTheme: _getOutlinedButtonTheme(),
    // text button theme
    textButtonTheme: _getTextButtonTheme(),
    // input decoration theme
    inputDecorationTheme: _getInputDecorationTheme(),
    // text selection theme
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: ColorManager.darkBlack),
    // checkbox theme
    checkboxTheme: _getCheckboxTheme(),
    // bottom navigation bar theme
    bottomNavigationBarTheme: _getBottomNavigationBarTheme(),
    // text theme
    textTheme: _getTextTheme(),
  );
}

// light card theme
CardTheme _getLightCardTheme() {
  return const CardTheme(
    color: ColorManager.white,
    elevation: AppSize.s4,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
  );
}

// app bar theme
AppBarTheme _getLightAppBarTheme() {
  return AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.black),
    elevation: AppSize.s0,
    backgroundColor: ColorManager.white,
    // systemOverlayStyle: const SystemUiOverlayStyle(
    //   statusBarColor: ColorManager.white,
    //   statusBarIconBrightness: Brightness.dark,
    // ),
    titleTextStyle:
        getMediumStyle(fontSize: FontSize.s20, color: ColorManager.darkBlack),
  );
}

// elevated button theme
ElevatedButtonThemeData _getElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: AppSize.s4,
      shape: const StadiumBorder(),
      textStyle: getRegularStyle(color: ColorManager.white),
      disabledBackgroundColor: ColorManager.darkBlue,
      disabledForegroundColor: ColorManager.white,
    ),
  );
}

// outlined button theme
OutlinedButtonThemeData _getOutlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: AppSize.s0,
      shape: const StadiumBorder(),
    ),
  );
}

// text button theme
TextButtonThemeData _getTextButtonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: const StadiumBorder(),
    ),
  );
}

// input decoration theme
InputDecorationTheme _getInputDecorationTheme() {
  return const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppSize.s20),
      ),
    ),
    filled: true,
    fillColor: ColorManager.lightGray,
    focusColor: ColorManager.lightBlue,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.lightGray),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.lightBlue),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
    ),
  );
}

// checkbox theme
CheckboxThemeData _getCheckboxTheme() {
  return const CheckboxThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s4))));
}

// bottom navigation theme
BottomNavigationBarThemeData _getBottomNavigationBarTheme() {
  return BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: ColorManager.white,
    unselectedItemColor: ColorManager.gray,
    selectedItemColor: ColorManager.lightBlue,
    elevation: AppSize.s0,
    unselectedLabelStyle:
        getRegularStyle(fontSize: FontSize.s12, color: ColorManager.gray),
    // selectedItemColor: SharedColors.orangeColor,
    selectedLabelStyle:
        getRegularStyle(fontSize: FontSize.s12, color: ColorManager.lightBlue),
  );
}

// text theme
TextTheme _getTextTheme() {
  return TextTheme(
    displayLarge:
        getBoldStyle(color: ColorManager.darkBlack, fontSize: FontSize.s32),
    displayMedium:
        getBoldStyle(color: ColorManager.darkBlack, fontSize: FontSize.s22),
    labelSmall:
        getRegularStyle(color: ColorManager.gray, fontSize: FontSize.s14),
  );
}
