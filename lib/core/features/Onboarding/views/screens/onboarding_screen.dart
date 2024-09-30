import 'package:Akombi/core/features/service_providers/views/screens/provider_listings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/sign_up/page/sign_up_page.dart';
import '../../bloc/onboarding_bloc.dart';
import '../widgets/onboarding_content.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<OnboardingBloc> _buildBody(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (BuildContext context) => OnboardingBloc(),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listenWhen: (_, currState) => currState is NextScreenState,
        listener: (context, state) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) {
                return ProviderListings();
              },
            ),
          );
        },
        buildWhen: (_, currState) => currState is OnboardingInitial,
        builder: (context, state) {
          return OnboardingContentWidget();
        },
      ),
    );
  }
}