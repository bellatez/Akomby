import 'package:Akombi/core/constants/colors.dart';
import 'package:Akombi/core/features/service_providers/models/provider_model.dart';
import 'package:Akombi/core/features/service_providers/models/providers_data.dart';
import 'package:Akombi/core/features/service_providers/views/widgets/provider_card.dart';
import 'package:Akombi/main.dart';
import 'package:flutter/material.dart';

class ProviderCard extends StatelessWidget {
  final int index;
  const ProviderCard({
    super.key,
    required this.providers,
    required this.index
  });

  final List providers;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.armsColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(providers[index].fullName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.white))),
                  Text(providers[index].typeOfService)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Age: ${providers[index].age} years old"),
                  Text("Quarter: ${providers[index].quarter}"),
                  // Text("Lang: ${providers[index].language}"),
                  // Text("Stay Option: ${providers[index].stayOption}")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
