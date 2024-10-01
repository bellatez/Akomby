import 'package:Akombi/core/features/service_providers/views/screens/profile/about.dart';
import 'package:Akombi/core/features/service_providers/views/screens/profile/reviews.dart';
import 'package:Akombi/core/features/service_providers/views/screens/profile/services.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../models/provider_model.dart';

class ProviderProfilePage extends StatelessWidget {
  final ProviderModel provider;

  const ProviderProfilePage({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 82.0),
              child: Text(
                'Profil',
                style: TextStyle(
                  color: ColorConstants.armsColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              // Profile section
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Image.network(
                          provider.profilePhotoUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      provider.fullName,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      provider.typeOfService,
                      style: TextStyle(
                        color: ColorConstants.armsColor,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Customized TabBar without the full horizontal line
              TabBar(
                labelColor: ColorConstants.armsColor,
                unselectedLabelColor: Colors.grey,
                indicator: UnderlineTabIndicator( // Customize the indicator
                  borderSide: BorderSide(
                    width: 2.0, // Adjust width of the indicator
                    color: ColorConstants.armsColor, // Indicator color
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 30.0), // Adjust horizontal padding
                ),
                tabs: const [
                  Tab(text: "About"),
                  Tab(text: "Services"),
                ],
              ),

              const SizedBox(height: 10),

              // TabBarView to display content for each tab
              Expanded(
                child: TabBarView(
                  children: [
                    About(provider: provider),
                    Services(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
