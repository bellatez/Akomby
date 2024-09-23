

import 'package:Akombi/core/Utils/text_strings.dart';
import 'package:Akombi/core/features/Onboarding/views/screens/onboarding_screen.dart';
import 'package:Akombi/core/features/service_providers/views/screens/provider_listings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Automatically use device locale
    Locale locale = Get.deviceLocale ?? const Locale('en', 'US'); // Fallback to 'en_US' if no device locale is found
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: locale, // Use device locale
      fallbackLocale: const Locale('en', 'US'), // Fallback locale
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const OnBoardingScreen()
      home: ProviderListings(),
    );
  }
}
