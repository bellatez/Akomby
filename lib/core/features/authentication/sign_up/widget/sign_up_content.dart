import 'package:Akombi/core/common_widgets/fitness_button.dart';
import 'package:Akombi/core/common_widgets/fitness_loading.dart';
import 'package:Akombi/core/common_widgets/fitness_text_field.dart';
import 'package:Akombi/core/constants/colors.dart';
import 'package:Akombi/core/features/authentication/sign_up/bloc/signup_bloc.dart';
import 'package:Akombi/core/services/validation_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorConstants.white,
        child: Stack(
          children: [
            _createMainData(context),
            BlocBuilder<SignUpBloc, SignUpState>(
              buildWhen: (_, currState) => currState is LoadingState || currState is NextTabBarPageState || currState is ErrorState,
              builder: (context, state) {
                if (state is LoadingState) {
                  return _createLoading();
                } else if (state is NextTabBarPageState || state is ErrorState) {
                  return const SizedBox();
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _createMainData(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _createTitle(),
            // const SizedBox(height: 50),
            _createForm(context),
            const SizedBox(height: 40),
            _createSignUpButton(context),
            // Spacer(),
            const SizedBox(height: 40),
            _createHaveAccountText(context),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _createLoading() {
    return FitnessLoading();
  }

  Widget _createTitle() {
    return const Text(
      'Sign Up',
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _createForm(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (_, currState) => currState is ShowErrorState,
      builder: (context, state) {
        return Column(
          children: [
            FitnessTextField(
              title: 'username',
              placeholder: 'TextConstants.userNamePlaceholder',
              controller: bloc.fullNameController,
              textInputAction: TextInputAction.next,
              errorText: 'TextConstants.usernameErrorText',
              isError: state is ShowErrorState ? !ValidationService.username(bloc.fullNameController.text) : false,
              onTextChanged: () {
                bloc.add(OnTextChangedEvent());
              },
            ),
            const SizedBox(height: 20),
            FitnessTextField(
              title: 'TextConstants.email',
              placeholder: 'TextConstants.emailPlaceholder',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: bloc.contactController,
              errorText: 'TextConstants.emailErrorText',
              isError: state is ShowErrorState ? !ValidationService.email(bloc.contactController.text) : false,
              onTextChanged: () {
                bloc.add(OnTextChangedEvent());
              },
            ),
            const SizedBox(height: 20),
            FitnessTextField(
              title: 'TextConstants.password',
              placeholder: 'TextConstants.passwordPlaceholder',
              obscureText: true,
              isError: state is ShowErrorState ? !ValidationService.password(bloc.passwordController.text) : false,
              textInputAction: TextInputAction.next,
              controller: bloc.passwordController,
              errorText: 'TextConstants.passwordErrorText',
              onTextChanged: () {
                bloc.add(OnTextChangedEvent());
              },
            ),
            const SizedBox(height: 20),
            FitnessTextField(
              title: 'TextConstants.confirmPassword',
              placeholder: 'TextConstants.confirmPasswordPlaceholder',
              obscureText: true,
              isError: state is ShowErrorState ? !ValidationService.confirmPassword(bloc.passwordController.text, bloc.confirmPasswordController.text) : false,
              controller: bloc.confirmPasswordController,
              errorText: 'TextConstants.confirmPasswordErrorText',
              onTextChanged: () {
                bloc.add(OnTextChangedEvent());
              },
            ),
          ],
        );
      },
    );
  }

  Widget _createSignUpButton(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (_, currState) => currState is SignUpButtonEnableChangedState,
        builder: (context, state) {
          return FitnessButton(
            title: 'TextConstants.signUp',
            isEnabled: state is SignUpButtonEnableChangedState ? state.isEnabled : false,
            onTap: () {
              FocusScope.of(context).unfocus();
              bloc.add(SignUpTappedEvent());
            },
          );
        },
      ),
    );
  }

  Widget _createHaveAccountText(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);
    return RichText(
      text: TextSpan(
        text: 'TextConstants.alreadyHaveAccount',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        children: [
          TextSpan(
            text: "signIn",
            style: const TextStyle(
              color: ColorConstants.tPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                bloc.add(SignInTappedEvent());
              },
          ),
        ],
      ),
    );
  }
}
