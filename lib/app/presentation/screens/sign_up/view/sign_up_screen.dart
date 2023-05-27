import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medita_patient/app/presentation/screens/sign_up/cubit/sign_up_cubit.dart';
import 'package:medita_patient/app/presentation/screens/sign_up/cubit/sign_up_status.dart';
import 'package:medita_patient/app/presentation/widgets/loading/loading_dialog.dart';

import '../../../manager/asset_manager.dart';
import '../../../manager/string_manager.dart';
import '../../../manager/values_manager.dart';
import '../../../widgets/authentication_divider/authentication_divider.dart';
import '../../../widgets/error_text_viewer.dart';
import '../../../widgets/social_authentication_button/icon_authentication_button.dart';
import '../../../widgets/svg_icon_button/svg_icon_button.dart';
import '../../../widgets/text_input_field/main_text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController _firstNameTextEditingController = TextEditingController();
  final TextEditingController _lastNameTextEditingController = TextEditingController();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignUpCubit signUpCubit = SignUpCubit.get(context);

    _firstNameTextEditingController.addListener(() => signUpCubit.setFirstName(_firstNameTextEditingController.text));
    _lastNameTextEditingController.addListener(() => signUpCubit.setLastName(_lastNameTextEditingController.text));
    _emailTextEditingController.addListener(() => signUpCubit.setEmail(_emailTextEditingController.text));
    _passwordTextEditingController.addListener(() => signUpCubit.setPassword(_passwordTextEditingController.text));

    return BlocConsumer<SignUpCubit, SignUpState>(
        listener: (_, SignUpState state) {
          if (state is SignUpSuccessSate) {
            signUpCubit.navigateToSignInScreen(context);
            signUpCubit.close();
          }

          if (state is SignUpLoadingSate) {
            if (state.loading) {
              showDialog(context: context, builder: (_) => const LoadingDialog());
            } else {
              Navigator.pop(context);
            }
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
                      StringManager.createNewAccount,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: AppSize.s20),
                    ErrorTextViewer(
                      isVisible: signUpCubit.errorText != null,
                      errorText: signUpCubit.errorText,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          MainTextInputField(
                            controller: _firstNameTextEditingController,
                            prefixIcon: SvgPicture.asset(ImageAsset.outlinedUserRoundedSvg),
                            hint: StringManager.firstName,
                            validator: signUpCubit.isValidFirstName,
                          ),
                          const SizedBox(height: AppSize.s10),
                          MainTextInputField(
                            controller: _lastNameTextEditingController,
                            prefixIcon: SvgPicture.asset(ImageAsset.outlinedUsersGroupRoundedSvg),
                            hint: StringManager.lastName,
                            validator: signUpCubit.isValidLastName,
                          ),
                          const SizedBox(height: AppSize.s10),
                          MainTextInputField(
                            controller: _emailTextEditingController,
                            prefixIcon: SvgPicture.asset(ImageAsset.outlinedEmailSvg),
                            hint: StringManager.email,
                            validator: signUpCubit.isValidEmail,
                          ),
                          const SizedBox(height: AppSize.s10),
                          MainTextInputField(
                            controller: _passwordTextEditingController,
                            maxLines: 1,
                            isObscureText: signUpCubit.isObscureText,
                            prefixIcon: SvgPicture.asset(ImageAsset.outlinedLockPasswordSvg),
                            suffixIcon: SvgIconButton(
                              svgPath: signUpCubit.isObscureText ? ImageAsset.outlinedEyeClosedSvg : ImageAsset.outlinedEyeSvg,
                              onPressed: signUpCubit.changeObscureTextState,
                            ),
                            hint: StringManager.password,
                            validator: signUpCubit.isValidPassword,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.s30),
                    SizedBox(
                      height: AppSize.defaultButtonHeight,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text(StringManager.signUp),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            signUpCubit.register();
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: AppSize.s20),
                    const AuthenticationDivider(
                        text: StringManager.orContinueWith),
                    const SizedBox(height: AppSize.s20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <IconAuthenticationButton>[
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
                          onPressed: () => signUpCubit.navigateToSignInScreen(context),
                          child: const Text(StringManager.signIn),
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
