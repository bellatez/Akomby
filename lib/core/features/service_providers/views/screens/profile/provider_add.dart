import 'package:flutter/material.dart';

import '../../../../../common_widgets/fitness_text_field.dart';
import '../../../../../common_widgets/provider_input.dart';
import '../../../../../common_widgets/settings_textfield.dart';

class AddProvider extends StatefulWidget {
  @override
  _AddProviderState createState() => _AddProviderState();
}

class _AddProviderState extends State<AddProvider> {
  final _formKey = GlobalKey<FormState>();

  String? fullName;
  int? age;
  String? quarter;
  String? language;
  String? stayOption;
  String? typeOfService;
  String? profilePhotoUrl;
  String? description;
  int? yearsOfExperience;
  int? homesWorked;
  bool hasNationalID = false;

  // List for the dropdown options
  final List<String> _languages = ['English', 'French'];
  final List<String> _stayOptions = ['Yes', 'No'];
  final List<String> _services = ['Babysitting', 'Housekeeping', 'Nursing'];
  TextEditingController fullNames = TextEditingController();
  TextEditingController
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProviderInputWidget(
                  controller: fullNames,
                  labelText: 'Enter you full names',
                  textInputType: TextInputType.text,
                  maxline: 1, hintText: 'John Doe',
                ),
                ProviderInputWidget(
                  controller: fullNames,
                  labelText: 'Enter you full names',
                  textInputType: TextInputType.text,
                  maxline: 1, hintText: 'John Doe',
                ),

                SizedBox(height: 16),

                // Quarter
                TextFormField(
                  decoration: InputDecoration(labelText: 'Quarter'),
                  onChanged: (value) {
                    quarter = value;
                  },
                ),
                SizedBox(height: 16),

                // Language Dropdown
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Language'),
                  items: _languages.map((language) {
                    return DropdownMenuItem(
                      value: language,
                      child: Text(language),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      language = value as String?;
                    });
                  },
                ),
                SizedBox(height: 16),

                // Stay Option Dropdown
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Stay Option'),
                  items: _stayOptions.map((stayOption) {
                    return DropdownMenuItem(
                      value: stayOption,
                      child: Text(stayOption),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      stayOption = value as String?;
                    });
                  },
                ),
                SizedBox(height: 16),

                // Type of Service Dropdown
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Type of Service'),
                  items: _services.map((service) {
                    return DropdownMenuItem(
                      value: service,
                      child: Text(service),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      typeOfService = value as String?;
                    });
                  },
                ),
                SizedBox(height: 16),

                // Years of Experience
                TextFormField(
                  decoration: InputDecoration(labelText: 'Years of Experience'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    yearsOfExperience = int.tryParse(value);
                  },
                ),
                SizedBox(height: 16),

                // Homes Worked
                TextFormField(
                  decoration: InputDecoration(labelText: 'Number of Homes Worked'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    homesWorked = int.tryParse(value);
                  },
                ),
                SizedBox(height: 16),

                // National ID Checkbox
                CheckboxListTile(
                  title: Text('Has National ID'),
                  value: hasNationalID,
                  onChanged: (bool? value) {
                    setState(() {
                      hasNationalID = value!;
                    });
                  },
                ),
                SizedBox(height: 16),

                // Description
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  onChanged: (value) {
                    description = value;
                  },
                ),
                SizedBox(height: 16),

                // Profile Photo URL
                TextFormField(
                  decoration: InputDecoration(labelText: 'Profile Photo URL'),
                  onChanged: (value) {
                    profilePhotoUrl = value;
                  },
                ),
                SizedBox(height: 32),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Perform form submission or navigation
                        print("Form Submitted");
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

