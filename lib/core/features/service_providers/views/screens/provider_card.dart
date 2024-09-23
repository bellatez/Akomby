import 'package:Akombi/core/Utils/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Center(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 10.0,
        runSpacing: 10.0,
        children: providers.map((provider) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.42,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    provider.profilePhotoUrl,
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.fullName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      provider.quarter,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        LocalKeys.viewProfile.tr,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
