import 'package:Akombi/core/Utils/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../common_widgets/fitness_button.dart';
import '../../../models/provider_model.dart';

class About extends StatelessWidget {
  // const About({super.key, required this.provider});
  // final ProviderModel provider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView( // Scrollable content
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 12.0),
            child: Column(
              children: [
                const Text(
                  'User Information',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height:5.0),
                const Text(
                  textAlign: TextAlign.justify,
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AboutItems(
                        iconData: Icons.location_on,
                        title: 'Lives in',
                        subTitle: 'provider.quarter',
                      ),
                      AboutItems(
                        iconData: Icons.calendar_month,
                        title: 'Age',
                        subTitle: 'provider.age.toString()',
                      ),
                      AboutItems(
                        iconData: Icons.work_history,
                        title: 'Years of Experience',
                        subTitle: 'provider.yearsOfExperience.toString()',
                      ),
                      AboutItems(
                        iconData: Icons.home,
                        title: 'Homes Worked',
                        subTitle: 'provider.homesWorked.toString()',
                      ),
                      AboutItems(
                        iconData: Icons.card_membership,
                        title: 'National ID',
                        subTitle: "provider.hasNationalID ? 'Yes' : 'No'",
                      ),
                      AboutItems(
                        iconData: Icons.language,
                        title: 'Languages spoken',
                        subTitle: 'provider.language',
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 100), // Extra space to avoid overlap with the fixed text
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0, // Fix at the bottom
          left: 0,
          right: 0,
          child: Container( // Optional: Background color for the text
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: FitnessButton(
                title: 'Call',
                onTap: () {  },),
            ),
          ),
        ),
      ],
    );
  }
}

class AboutItems extends StatelessWidget {
  const AboutItems({
    super.key,
    required this.iconData,
    required this.title,
    required this.subTitle,
  });

  final IconData iconData;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.grey,
            size: 32,
          ),
          const SizedBox(width: 25,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}