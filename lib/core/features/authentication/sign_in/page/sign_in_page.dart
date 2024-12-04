import 'package:Akombi/core/features/authentication/sign_up/page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:Akombi/core/common_widgets/fitness_button.dart';

import '../../../../common_widgets/fitness_text_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Main Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  // Header Text
                  const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Email TextField
                  FitnessTextField(
                    title: 'Email',
                    placeholder: 'akomby@gmail.com',
                    controller: emailController,
                    onTextChanged: () {},
                    errorText: '',
                  ),
                  const SizedBox(height: 20),
                  // Password TextField
                  FitnessTextField(
                    title: 'Password',
                    placeholder: '********',
                    controller: passwordController,
                    onTextChanged: () {},
                    errorText: '',
                  ),
                  const SizedBox(height: 20),
                  // Forgot Password
                  GestureDetector(
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {
                      // Handle forgot password logic
                    },
                  ),
                  const SizedBox(height: 40),
                  // Sign In Button
                  FitnessButton(
                    title: "Sign In",
                    onTap: () {
                      // Handle sign-in logic
                    },
                  ),
                ],
              ),
            ),


            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to Sign-Up Page
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SignUpPage(), // Replace with SignUpPage
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
