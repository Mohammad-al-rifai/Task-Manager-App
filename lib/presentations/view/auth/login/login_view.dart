import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/components/button.dart';
import '../../../../core/utils/components/notifications/my_toast.dart';
import '../../../../core/utils/components/text_button.dart';
import '../../../../core/utils/components/text_form_field.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../../core/utils/functions/validations.dart';
import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/utils/resources/styles_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../../cubits/auth_cubit/auth_cubit.dart';
import '../../../layouts/home_layout/home_layout.dart';
import '../../../widgets/auth_background_widget.dart';
import '../../../widgets/container_box.dart';
import '../../../widgets/or_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassShowed = true;
  late AuthCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of(context);
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginDoneState) {
          showToast(text: AppStrings.success, state: ToastStates.SUCCESS);
          navigateAndFinish(context, const HomeLayout());
        }
        if (state is LoginErrorState) {
          showToast(text: state.errorMSG, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AuthBackGroundWidget(title: AppStrings.logIn),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(AppPadding.p18),
                    child: Column(
                      children: [
                        buildEmailPasswordForm(),
                        SizedBox(height: AppSize.s30),
                        buildLoginButton(),
                        SizedBox(height: AppSize.s8),
                        buildForgetPasswordItem(),
                        const ORWidget(),
                        buildRegisterItem(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildEmailPasswordForm() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1800),
      child: AuthContainerBox(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TFF(
                controller: userNameController,
                keyboardType: TextInputType.emailAddress,
                label: AppStrings.userName,
                prefixIcon: CupertinoIcons.person,
                validator: (String value) {
                  if (!Validations.isUserName(value)) {
                    return AppStrings.pleaseTypeAValidUserName;
                  }
                },
              ),
              SizedBox(height: AppSize.s12),
              TFF(
                isPassword: isPassShowed,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                label: AppStrings.password,
                prefixIcon: CupertinoIcons.lock,
                validator: (String value) {
                  if (!Validations.isPassword(value)) {
                    return AppStrings.pleaseTypeAValidPassword;
                  }
                },
                suffix: isPassShowed
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                suffixPressed: () => changeVisibility(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return FadeInUp(
          duration: const Duration(milliseconds: 1900),
          child: DefaultButton(
            function: () {
              if (formKey.currentState!.validate()) {
                cubit.login(
                  userName: userNameController.text,
                  password: passwordController.text,
                );
              }
            },
            isLoading: state is LoginLoadingState,
            text: AppStrings.logIn,
          ),
        );
      },
    );
  }

  Widget buildForgetPasswordItem() {
    return FadeInUp(
      duration: const Duration(milliseconds: 2000),
      child: DTextButton(
        text: AppStrings.forgetPassword,
        function: () {},
      ),
    );
  }

  Widget buildRegisterItem() {
    return FadeInUp(
      duration: const Duration(milliseconds: 2300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.dontHaveAccount,
            style: getRegularStyle(
              color: ColorManager.primary,
            ),
          ),
          DTextButton(
            text: AppStrings.register,
            isUpperCase: true,
            function: () {},
          ),
        ],
      ),
    );
  }

  changeVisibility() {
    setState(() {
      isPassShowed = !isPassShowed;
    });
  }
}
