import 'package:Akombi/core/Utils/text_strings.dart';
import 'package:Akombi/core/features/Onboarding/views/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'core/features/payments/screens/payments.dart';
import 'core/features/service_providers/controller/nannies.dart';
import 'firebase_options.dart';
import './helper/init_controllers.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const OnBoardingScreen()
      // home: ProviderListings(),
    );
  }
}





Future<void> init() async {
  Get.put(ProviderNanniesController());
}