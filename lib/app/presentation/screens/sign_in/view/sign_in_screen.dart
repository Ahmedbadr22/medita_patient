import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';
import 'package:medita_patient/app/presentation/manager/values_manager.dart';
import 'package:medita_patient/app/presentation/screens/sign_in/cubit/sign_in_cubit.dart';
import 'package:medita_patient/app/presentation/screens/sign_in/cubit/sign_in_states.dart';
import 'package:medita_patient/app/presentation/widgets/error_text_viewer.dart';
import 'package:medita_patient/app/presentation/widgets/text_input_field/main_text_input_field.dart';

import '../../../widgets/authentication_divider/authentication_divider.dart';
import '../../../widgets/social_authentication_button/icon_authentication_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignInCubit signInCubit = SignInCubit.get(context);

    _emailTextEditingController.addListener(
        () => signInCubit.setEmail(_emailTextEditingController.text));
    _passwordTextEditingController.addListener(
        () => signInCubit.setPassword(_passwordTextEditingController.text));

    return BlocConsumer<SignInCubit, SignInState>(
      listener: (_, state) {
        if (state is SignInSuccessSate) {
          signInCubit.navigateToNavigationScreen(context);
        }
      },
      builder: (_, __) {
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
                  ErrorTextViewer(
                    isVisible: signInCubit.errorText != null,
                    errorText: signInCubit.errorText,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        MainTextInputField(
                          controller: _emailTextEditingController,
                          textInputType: TextInputType.emailAddress,
                          prefixIcon:
                              SvgPicture.asset(ImageAsset.outlinedEmailSvg),
                          hint: StringManager.email,
                          validator: signInCubit.isValidEmail,
                        ),
                        const SizedBox(height: AppSize.s10),
                        MainTextInputField(
                          controller: _passwordTextEditingController,
                          textInputType: TextInputType.text,
                          prefixIcon: SvgPicture.asset(
                            ImageAsset.outlinedLockPasswordSvg,
                          ),
                          isObscureText: signInCubit.isObscureText,
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(
                              signInCubit.isObscureText
                                  ? ImageAsset.outlinedEyeSvg
                                  : ImageAsset.outlinedEyeClosedSvg,
                              height: 24,
                              width: 24,
                            ),
                            onPressed: signInCubit.changeObscureTextState,
                          ),
                          hint: StringManager.password,
                          validator: signInCubit.isValidPassword,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: signInCubit.isRememberMe,
                        onChanged: signInCubit.changeIsRememberMeState,
                      ),
                      const Text(StringManager.rememberMe)
                    ],
                  ),
                  const SizedBox(height: AppSize.s10),
                  SizedBox(
                    height: AppSize.defaultButtonHeight,
                    width: double.infinity,
                    child: Visibility(
                      visible: !signInCubit.isLoadingState,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        child: const Text(StringManager.signIn),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //  signInCubit.login();
                            signInCubit.navigateToNavigationScreen(context);
                          }
                        },
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(StringManager.forgotPassword),
                  ),
                  const SizedBox(height: AppSize.s10),
                  const AuthenticationDivider(
                      text: StringManager.orContinueWith),
                  const SizedBox(height: AppSize.s20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <IconAuthenticationButton>[
                      IconAuthenticationButton(
                          iconPath: ImageAsset.facebookLogoSvg),
                      IconAuthenticationButton(
                          iconPath: ImageAsset.googleLogoSvg),
                      IconAuthenticationButton(
                          iconPath: ImageAsset.appleLogoSvg),
                    ],
                  ),
                  const SizedBox(height: AppSize.s20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(StringManager.haveAnAccount),
                      TextButton(
                        onPressed: () =>
                            signInCubit.navigateToSignUpScreen(context),
                        child: const Text(StringManager.signUp),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
