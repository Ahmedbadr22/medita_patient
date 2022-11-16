import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/widgets/text_input_field/main_text_input_field.dart';

import '../../../widgets/authentication_divider/authentication_divider.dart';
import '../../../widgets/social_authentication_button/icon_authentication_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
                StringManager.loginToYourAccount,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: AppSize.s20),
              Column(
                children: const <Widget>[
                  MainTextInputField(
                    prefixIcon: Icon(Icons.email),
                    hint: StringManager.email
                  ),
                  SizedBox(height: AppSize.s10),
                  MainTextInputField(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    hint: StringManager.password,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(value: false, onChanged: (bool? value) {}),
                  const Text(StringManager.rememberMe)
                ],
              ),
              const SizedBox(height: AppSize.s10),
              SizedBox(
                height: AppSize.defaultButtonHeight,
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text(StringManager.signIn),
                  onPressed: () => navigateToMainScreen(context),
                ),
              ),
              TextButton(
                onPressed: (){},
                child: const Text(StringManager.forgotPassword),
              ),
              const SizedBox(height: AppSize.s10),
              const AuthenticationDivider(text: StringManager.orContinueWith),
              const SizedBox(height: AppSize.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <IconAuthenticationButton>[
                  IconAuthenticationButton(
                      iconPath: ImageAsset.facebookLogoSvg),
                  IconAuthenticationButton(iconPath: ImageAsset.googleLogoSvg),
                  IconAuthenticationButton(iconPath: ImageAsset.appleLogoSvg),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(StringManager.haveAnAccount),
                  TextButton(
                    onPressed: () => navigateToSignUpScreen(context),
                    child: const Text(StringManager.signUp),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToSignUpScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.signUpRoute);
  }

  void navigateToMainScreen(BuildContext context) {
    Navigator.popAndPushNamed(context, Routes.mainRoute);
  }
}
