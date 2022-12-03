import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../manager/asset_manager.dart';
import '../../../manager/routes_manager.dart';
import '../../../manager/string_manager.dart';
import '../../../manager/values_manager.dart';
import '../../../widgets/authentication_divider/authentication_divider.dart';
import '../../../widgets/social_authentication_button/icon_authentication_button.dart';
import '../../../widgets/svg_icon_button/svg_icon_button.dart';
import '../../../widgets/text_input_field/main_text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p32),
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                ImageAsset.blackLogoImagePath,
                height: AppSize.s100,
              ),
              const SizedBox(height: AppSize.s40),
              Text(
                StringManager.createNewAccount,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: AppSize.s20),
              Column(
                children: <Widget> [
                  const SizedBox(height: AppSize.s10),
                  MainTextInputField(
                    prefixIcon: SvgPicture.asset(ImageAsset.outlinedEmailSvg),
                    hint: StringManager.email,
                  ),
                  const SizedBox(height: AppSize.s10),
                  MainTextInputField(
                    prefixIcon: SvgPicture.asset(ImageAsset.outlinedLockPasswordSvg),
                    suffixIcon: SvgIconButton(
                      svgPath: ImageAsset.outlinedEyeClosedSvg,
                      onPressed: (){},
                    ),
                    hint: StringManager.password,
                  ),
                  const SizedBox(height: AppSize.s10),
                  MainTextInputField(
                    prefixIcon: SvgPicture.asset(ImageAsset.outlinedLockPasswordSvg),
                    suffixIcon: SvgIconButton(
                      svgPath: ImageAsset.outlinedEyeClosedSvg,
                      onPressed: (){},
                    ),
                    hint: StringManager.confirmPassword,
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s30),
              SizedBox(
                height: AppSize.defaultButtonHeight,
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text(StringManager.signUp),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: AppSize.s20),
              const AuthenticationDivider(text: StringManager.orContinueWith),
              const SizedBox(height: AppSize.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <IconAuthenticationButton>[
                  IconAuthenticationButton(iconPath: ImageAsset.facebookLogoSvg),
                  IconAuthenticationButton(iconPath: ImageAsset.googleLogoSvg),
                  IconAuthenticationButton(iconPath: ImageAsset.appleLogoSvg),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  const Text(StringManager.haveAnAccount),
                  TextButton(
                    onPressed: () => navigateToSignInScreen(context),
                    child: const Text(StringManager.signIn),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToSignInScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.signInRoute);
  }
}
