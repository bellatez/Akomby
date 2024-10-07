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

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child:  SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: providers.length,
            itemBuilder: (context, index){
              var provider = providers[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderProfilePage(provider: providers[index])));
                },
                child:  Card(
                  elevation: 8.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(provider.profilePhotoUrl),
                            radius: 50.0,
                          ),
                        ),

                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  provider.fullName,
                                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                                ),
                              ),

                              Center(
                                child: Text(
                                  provider.quarter,
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                  "${LocalKeys.iAm.tr}: ${provider.age} years old"
                              ),
                              Text(
                                  "Language: ${provider.language}"
                              ),
                              Text(
                                  "Experience: ${provider.yearsOfExperience} Year/s"
                              ),
                              const SizedBox(height: 25,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );

            }),
      ),

    );

  }
}
