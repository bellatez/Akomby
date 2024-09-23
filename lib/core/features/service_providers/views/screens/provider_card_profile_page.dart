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
    return Scaffold(
        appBar: AppBar(
          title: Text(provider.fullName, style: TextStyle(color: Colors.white),),
          backgroundColor: ColorConstants.tPrimaryColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            const SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                provider.profilePhotoUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // Full Name
            Text(
              provider.fullName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            // Description
            Text(
              provider.description ?? 'No description available.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            // Details
            Text(
              'Quarter: ${provider.quarter}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Language: ${provider.language}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Stay Option: ${provider.stayOption}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Type of Service: ${provider.typeOfService}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            // Contact Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle contact action
                },
                child: Text('Contact'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
