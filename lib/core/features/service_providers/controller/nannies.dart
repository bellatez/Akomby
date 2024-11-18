import 'dart:developer';

import 'package:get/get.dart';

import '../models/provider_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProviderNanniesController extends GetxController{
  var providers = <ProviderModel>[].obs;
  var isLoading = false.obs;

  String nanniesCollection = "ProviderNannies";

  @override
  @override
  void onInit() {
    // TODO: implement onInit
    fetchProviders();
    super.onInit();
  }
  Future<void> fetchProviders() async{
    try{
      isLoading(true);
      final snapshot = await FirebaseFirestore.instance.collection(nanniesCollection).get();
      providers.value = snapshot.docs
                        .map((doc) => ProviderModel.fromJson(doc.data()))
                        .toList();
      Get.snackbar("Success", "Gotten the results");
      log("Result are: ${providers.value}");
    } catch(e){
      log("Error $e");
      Get.snackbar("Error", "Failed to fetch data");
    } finally {
      isLoading(false);
    }
  }
}