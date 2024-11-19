import 'package:Akombi/core/constants/colors.dart';
import 'package:Akombi/core/features/service_providers/controller/nannies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common_widgets/fitness_text_field.dart';

class ProviderNaniesAddPage extends StatelessWidget {
  ProviderNaniesAddPage({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController quarterController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController stayOptionController = TextEditingController();
  final TextEditingController typeOfServiceController = TextEditingController();
  final TextEditingController profilePhotoUrlController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController yearsOfExperienceController = TextEditingController();
  final TextEditingController homesWorkedController = TextEditingController();
  bool hasNationalID = false;

  void saveNanny(BuildContext context) {
    if (fullNameController.text.isEmpty ||
        ageController.text.isEmpty ||
        quarterController.text.isEmpty ||
        languageController.text.isEmpty ||
        stayOptionController.text.isEmpty ||
        typeOfServiceController.text.isEmpty ||
        profilePhotoUrlController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        yearsOfExperienceController.text.isEmpty ||
        homesWorkedController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    // Logic for saving data to Firebase or other logic can go here.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Nanny added successfully!')),
    );
  }

  NannyToggle controllerNanny = Get.find<NannyToggle>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Add Nanny',
          style: TextStyle(
            color: Colors.white, fontSize: 20
          ),
        ),
        backgroundColor: ColorConstants.tPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FitnessTextField(
              title: "Full Name",
              placeholder: "Enter full name",
              errorText: "Full name is required",
              controller: fullNameController,
              onTextChanged: () {},
            ),
            const SizedBox(height: 16.0),
            FitnessTextField(
              title: "Age",
              placeholder: "Enter age",
              errorText: "Age is required",
              controller: ageController,
              onTextChanged: () {},
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            FitnessTextField(
              title: "Quarter",
              placeholder: "Enter quarter",
              errorText: "Quarter is required",
              controller: quarterController,
              onTextChanged: () {},
            ),
            const SizedBox(height: 16.0),
            FitnessTextField(
              title: "Language",
              placeholder: "Enter language",
              errorText: "Language is required",
              controller: languageController,
              onTextChanged: () {},
            ),
            const SizedBox(height: 16.0),
            FitnessTextField(
              title: "Stay Option",
              placeholder: "Enter stay option",
              errorText: "Stay option is required",
              controller: stayOptionController,
              onTextChanged: () {},
            ),
            const SizedBox(height: 16.0),
            FitnessTextField(
              title: "Type of Service",
              placeholder: "Enter type of service",
              errorText: "Type of service is required",
              controller: typeOfServiceController,
              onTextChanged: () {},
            ),
            const SizedBox(height: 16.0),
            FitnessTextField(
              title: "Profile Photo URL",
              placeholder: "Enter profile photo URL",
              errorText: "Profile photo URL is required",
              controller: profilePhotoUrlController,
              onTextChanged: () {},
            ),
            const SizedBox(height: 16.0),
            FitnessTextField(
              title: "Description",
              placeholder: "Enter description",
              errorText: "Description is required",
              controller: descriptionController,
              onTextChanged: () {},
            ),
            const SizedBox(height: 16.0),
            FitnessTextField(
              title: "Years of Experience",
              placeholder: "Enter years of experience",
              errorText: "Years of experience is required",
              controller: yearsOfExperienceController,
              onTextChanged: () {},
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            FitnessTextField(
              title: "Homes Worked",
              placeholder: "Enter number of homes worked",
              errorText: "Number of homes worked is required",
              controller: homesWorkedController,
              onTextChanged: () {},
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Obx(() {
                  return Checkbox( // Add 'return' here
                    value: controllerNanny.hasNationalID.value,
                    onChanged: (value) {
                      controllerNanny.toggleNationalID(value ?? false);
                      print(controllerNanny.hasNationalID.value);
                    },
                  );
                }),
                const Text("Has National ID"),
              ],
            ),
            const SizedBox(height: 24.0),
            Center(
              child: ElevatedButton(
                onPressed: () => saveNanny(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.tPrimaryColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  "Save Nanny",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
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
