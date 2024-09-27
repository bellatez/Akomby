import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../models/provider_model.dart';

class ProviderProfilePage extends StatelessWidget {
  final ProviderModel provider;

  const ProviderProfilePage({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 82.0),
              child: Text(
                'Profile',
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

              // Move TabBar here
              TabBar(
                labelColor: ColorConstants.armsColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: ColorConstants.armsColor,
                tabs: const [
                  Tab(text: "About"),
                  Tab(text: "Services"),
                  Tab(text: "Reviews"),
                ],
              ),

              const SizedBox(height: 10),

              // TabBarView to display content for each tab
              Expanded(
                child: TabBarView(
                  children: [
                    // About tab content
                    Center(
                      child: Text(
                        "About ${provider.fullName}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    // Services tab content
                    Center(
                      child: Text(
                        "${provider.fullName}'s Services",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    // Reviews tab content
                    Center(
                      child: Text(
                        "Reviews for ${provider.fullName}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
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
