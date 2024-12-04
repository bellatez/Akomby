import 'package:Akombi/core/features/authentication/controller/auth.dart';
import 'package:Akombi/core/features/service_providers/controller/nannies.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<void> init() async {
  Get.put(ProviderNanniesController());
  Get.put(AuthController());
}