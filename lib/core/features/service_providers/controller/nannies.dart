import 'dart:developer';

import 'package:get/get.dart';

import '../models/provider_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProviderNanniesController extends GetxController{
  var providers = <ProviderModel>[].obs;
  var isLoading = false.obs;

  String nanniesCollection = "ProviderNannies";

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProviderNanny();
    super.onInit();
  }
  Future<void> fetchProviderNanny() async{
    try{
      isLoading(true);
      final snapshot = await FirebaseFirestore.instance.collection(nanniesCollection).snapshots().listen((snapshot){
        providers.value = snapshot.docs
            .map((doc) => ProviderModel.fromJson(doc.data()))
            .toList();
      });
      Get.snackbar("Success", "Gotten the results");
      log("Result are: ${providers.value}");
    } catch(e){
      log("Error $e");
      Get.snackbar("Error", "Failed to fetch data");
    } finally {
      isLoading(false);
    }
  }

  Future<void> addProviderNanny(ProviderModel provider) async{
    try{
      isLoading.value = true;
      await FirebaseFirestore.instance.collection(nanniesCollection).add(provider.toJson());

      Get.snackbar("Success", "Provider Added Successfully");

    } catch(e){
      Get.snackbar("Error", "Failed to add provider");
      log("Error: $e");

    } finally{
      isLoading.value = false;
    }
  }
}



class NannyToggle extends GetxController{
  RxBool hasNationalID = false.obs;

  void toggleNationalID(bool value){
    hasNationalID.value = value;
  }
}