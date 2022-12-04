import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/app/di.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/routes_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/sign_in/view_model/sign_in_view_model.dart';
import 'package:medita_patient/app/presentation/widgets/text_input_field/main_text_input_field.dart';

import '../../../widgets/authentication_divider/authentication_divider.dart';
import '../../../widgets/social_authentication_button/icon_authentication_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _emailTextEditingController.addListener(
        () => _viewModel.setEmail(_emailTextEditingController.text));
    _passwordTextEditingController.addListener(
        () => _viewModel.setPassword(_passwordTextEditingController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }

  Scaffold getContent() {
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
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    StreamBuilder(
                      stream: _viewModel.outIsValidEmail,
                      builder:
                          (BuildContext context, AsyncSnapshot<String?> snapshot) {
                        return MainTextInputField(
                          controller: _emailTextEditingController,
                          prefixIcon:
                              SvgPicture.asset(ImageAsset.outlinedEmailSvg),
                          hint: StringManager.email,
                          errorText: snapshot.data,
                        );
                      },
                    ),
                    const SizedBox(height: AppSize.s10),
                    StreamBuilder(
                      stream: _viewModel.outIsValidPassword,
                      builder:
                          (BuildContext context, AsyncSnapshot<String?> snapshot) {
                        return MainTextInputField(
                          controller: _passwordTextEditingController,
                          prefixIcon: SvgPicture.asset(
                              ImageAsset.outlinedLockPasswordSvg),
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(
                              ImageAsset.outlinedEyeClosedSvg,
                              height: 24,
                              width: 24,
                            ),
                            onPressed: () {},
                          ),
                          hint: StringManager.password,
                          errorText: snapshot.data
                        );
                      },
                    ),
                  ],
                ),
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
                    onPressed: () {
                      _viewModel.login();
                      // navigateToNavigationScreen(context);
                    }),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(StringManager.forgotPassword),
              ),
              const SizedBox(height: AppSize.s10),
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

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void navigateToSignUpScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.signUpRoute);
  }

  // void navigateToMainScreen(BuildContext context) {
  void navigateToNavigationScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.navigationRoute);
  }
}
