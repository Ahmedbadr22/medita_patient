import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/color_manager.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/widgets/authentication_divider/authentication_divider.dart';
import 'package:medita_patient/app/presentation/widgets/social_authentication_button/social_authentication_button.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            const SizedBox(height: AppSize.s20),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SvgPicture.asset(
                        ImageAsset.blackLogoImagePath,
                        width: AppSize.s140,
                      ),
                    ),
                    Container(
                      width: AppSize.s1,
                      color: ColorManager.gray,
                      height: AppSize.s100,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TODO: May be changed
                            Text(
                              "Patient",
                              style:
                                  Theme.of(context).textTheme.displayMedium,
                            ),
                            Text(
                              "Your Health",
                              style:
                                  Theme.of(context).textTheme.displayMedium,
                            ),
                            Text(
                              "Is Our Goal",
                              style:
                                  Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: AppSize.s20),
                Text(
                  "Let's you in",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.s32),
              child: Column(
                children: [
                  const SizedBox(height: AppSize.s40),
                  Column(
                    children: const <Widget>[
                      SocialAuthenticationButton(
                        platformName: StringManager.facebook,
                        iconPath: ImageAsset.facebookLogoSvg,
                      ),
                      SizedBox(height: AppSize.s10),
                      SocialAuthenticationButton(
                        platformName: StringManager.google,
                        iconPath: ImageAsset.googleLogoSvg,
                      ),
                      SizedBox(height: AppSize.s10),
                      SocialAuthenticationButton(
                        platformName: StringManager.apple,
                        iconPath: ImageAsset.appleLogoSvg,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s20),
                  const AuthenticationDivider(text: StringManager.or),
                  const SizedBox(height: AppSize.s20),
                  SizedBox(
                    width: double.infinity,
                    height: AppSize.defaultButtonHeight,
                    child: ElevatedButton(
                      onPressed: navigateToSignInScreen,
                      child: const Text(StringManager.signInWithEmail),
                    ),
                  ),
                  const SizedBox(height: AppSize.s20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(StringManager.haveAnAccount),
                      TextButton(
                        onPressed: navigateToSignUpScreen,
                        child: const Text(StringManager.signUp),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateToSignInScreen() {
    Navigator.pushNamed(context, Routes.signInRoute);
  }

  void navigateToSignUpScreen() {
    Navigator.pushNamed(context, Routes.signUpRoute);
  }
}
