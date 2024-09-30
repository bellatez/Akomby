import 'package:Akombi/core/common_widgets/fitness_button.dart';
import 'package:Akombi/core/features/payments/screens/payments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text('hello there'),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FitnessButton(
                  height: 35,
                  title: 'Sign Up',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PaymentPage()));
                    // MaterialPageRoute(builder: (context) => ProviderProfilePage(provider: provider,)));
                  },

                ),
              ),
            ),
          ],
        )
    );
  }

  // BlocProvider<SignUpBloc> _buildBody(BuildContext context) {
  //   return BlocProvider<SignUpBloc>(
  //     create: (BuildContext context) => SignUpBloc(),
  //     child: BlocConsumer<SignUpBloc, SignUpState>(
  //       listenWhen: (_, currState) => currState is NextTabBarPageState || currState is NextSignInPageState || currState is ErrorState,
  //       listener: (context, state) {
  //         if (state is NextTabBarPageState) {
  //           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => TabBarPage()));
  //         } else if (state is NextSignInPageState) {
  //           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SignInPage()));
  //         } else if (state is ErrorState) {
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: Text(state.message)),
  //           );
  //         }
  //       },
  //       buildWhen: (_, currState) => currState is SignupInitial,
  //       builder: (context, state) {
  //         return SignUpContent();
  //       },
  //     ),
  //   );
  // }
}
