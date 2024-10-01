import 'package:Akombi/core/Utils/text_strings.dart';
import 'package:Akombi/core/features/authentication/sign_up/page/sign_up_page.dart';
import 'package:Akombi/core/features/service_providers/views/screens/profile/provider_card_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/fitness_button.dart';
import '../../../../constants/colors.dart';
import '../../models/provider_model.dart';

class ProviderCard extends StatelessWidget {
  final List<ProviderModel> providers;
  final int index;

  const ProviderCard({
    super.key,
    required this.providers,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final List<ProviderModel> providers = [
      ProviderModel(
        fullName: "Marie Ndumbe",
        age: 45,
        quarter: "Biyem-Assi, Yaoundé",
        language: "French, English",
        stayOption: "Any/Flexible",
        typeOfService: "Maid",
        profilePhotoUrl: 'https://www.shutterstock.com/image-photo/african-american-mom-holding-her-260nw-1937816044.jpg',
        description: "Experienced maid with over 15 years in household management.",
        yearsOfExperience: 15,
        homesWorked: 10,
        hasNationalID: true,
      ),
      ProviderModel(
        fullName: "Jean-Pierre Nguemo",
        age: 32,
        quarter: "Akwa, Douala",
        language: "French, English",
        stayOption: "Short-term",
        typeOfService: "Driver",
        profilePhotoUrl: 'https://www.shutterstock.com/image-photo/african-american-mom-holding-her-260nw-1937816044.jpg',
        description: "Reliable driver with a clean driving record.",
        yearsOfExperience: 8,
        homesWorked: 5,
        hasNationalID: true,
      ),
      ProviderModel(
        fullName: "Amina Mouafo",
        age: 28,
        quarter: "Mokolo, Garoua",
        language: "French, English",
        stayOption: "Long-term",
        typeOfService: "Nanny",
        profilePhotoUrl: 'https://www.shutterstock.com/image-photo/african-american-mom-holding-her-260nw-1937816044.jpg',
        description: "Caring nanny with a passion for children.",
        yearsOfExperience: 6,
        homesWorked: 4,
        hasNationalID: false,
      ),
      ProviderModel(
        fullName: "Samuel Nguiffo",
        age: 40,
        quarter: "Bamenda",
        language: "English, Pidgin",
        stayOption: "Any/Flexible",
        typeOfService: "Cook",
        profilePhotoUrl: 'https://www.shutterstock.com/image-photo/african-american-mom-holding-her-260nw-1937816044.jpg',
        description: "Professional cook specializing in local and continental cuisine.",
        yearsOfExperience: 12,
        homesWorked: 7,
        hasNationalID: true,
      ),
      ProviderModel(
        fullName: "Clara Fongang",
        age: 35,
        quarter: "Ngoundéré",
        language: "French, English",
        stayOption: "Short-term",
        typeOfService: "Housekeeper",
        profilePhotoUrl: 'https://www.shutterstock.com/image-photo/african-american-mom-holding-her-260nw-1937816044.jpg',
        description: "Detail-oriented housekeeper with great references.",
        yearsOfExperience: 10,
        homesWorked: 5,
        hasNationalID: true,
      ),
      ProviderModel(
        fullName: "Felix Tchatchouang",
        age: 50,
        quarter: "Limbe",
        language: "English, French",
        stayOption: "Any/Flexible",
        typeOfService: "Gardener",
        profilePhotoUrl: 'https://www.shutterstock.com/image-photo/african-american-mom-holding-her-260nw-1937816044.jpg',
        description: "Experienced gardener with knowledge of local flora.",
        yearsOfExperience: 15,
        homesWorked: 8,
        hasNationalID: true,
      ),
      ProviderModel(
        fullName: "Nadia Abou",
        age: 29,
        quarter: "Yaoundé",
        language: "French, English",
        stayOption: "Long-term",
        typeOfService: "Companion",
        profilePhotoUrl: 'https://www.shutterstock.com/image-photo/african-american-mom-holding-her-260nw-1937816044.jpg',
        description: "Compassionate companion providing support and care.",
        yearsOfExperience: 4,
        homesWorked: 3,
        hasNationalID: false,
      ),
      ProviderModel(
        fullName: "Lucien Tchoupa",
        age: 37,
        quarter: "Douala",
        language: "French, English",
        stayOption: "Any/Flexible",
        typeOfService: "Maintenance Worker",
        profilePhotoUrl: 'https://www.shutterstock.com/image-photo/african-american-mom-holding-her-260nw-1937816044.jpg',
        description: "Handyman skilled in various repairs and maintenance.",
        yearsOfExperience: 10,
        homesWorked: 6,
        hasNationalID: true,
      ),
      ProviderModel(
        fullName: "Esther Ngwa",
        age: 33,
        quarter: "Bafoussam",
        language: "French, English",
        stayOption: "Short-term",
        typeOfService: "Pet Sitter",
        profilePhotoUrl: 'https://www.shutterstock.com/image-photo/african-american-mom-holding-her-260nw-1937816044.jpg',
        description: "Loving pet sitter with experience in caring for dogs and cats.",
        yearsOfExperience: 5,
        homesWorked: 3,
        hasNationalID: false,
      ),
      ProviderModel(
        fullName: "Pauline Mvondo",
        age: 48,
        quarter: "Ebolowa",
        language: "French, English",
        stayOption: "Any/Flexible",
        typeOfService: "Personal Assistant",
        profilePhotoUrl: 'https://www.shutterstock.com/image-photo/african-american-mom-holding-her-260nw-1937816044.jpg',
        description: "Organized personal assistant with excellent communication skills.",
        yearsOfExperience: 20,
        homesWorked: 15,
        hasNationalID: true,
      ),
    ];


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: providers.length,
              itemBuilder: (context, index){
                var provider = providers[index];
              return Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Applying the border radius here
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0, bottom: 75, left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          provider.profilePhotoUrl,
                          width: 110,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            provider.fullName,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            "Menagere",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            provider.typeOfService,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "${LocalKeys.iAm.tr}: ${provider.age} years old"
                          ),
                          Text(
                              "${LocalKeys.iLiveIn.tr}: ${provider.quarter}"
                          ),
                          const SizedBox(height: 25,),
                          Container(
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                              color: ColorConstants.tPrimaryColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderProfilePage(provider: providers[index])));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.person, color: Colors.white,),
                                    const SizedBox(width: 5,),
                                    Text(
                                      LocalKeys.viewProfileDetails.tr,
                                      style: TextStyle(
                                        color: ColorConstants.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
          }),
        )
      ),
    );

  }
}
