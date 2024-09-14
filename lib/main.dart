import 'package:Akombi/core/Utils/text_strings.dart';
import 'package:Akombi/core/features/Onboarding/views/screens/onboarding_screen.dart';
import 'package:Akombi/core/features/service_providers/views/screens/provider_listings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: AppTranslations(),
        locale: Get.deviceLocale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      // home: const OnBoardingScreen()
      home: ProviderListings()
    );
  }
}
