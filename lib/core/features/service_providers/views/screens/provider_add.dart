import 'package:Akombi/core/common_widgets/fitness_button.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/fitness_text_field.dart';
import '../../../../common_widgets/provider_input.dart';
import '../../../../common_widgets/settings_textfield.dart';

class AddProvider extends StatefulWidget {
  @override
  _AddProviderState createState() => _AddProviderState();
}

class _AddProviderState extends State<AddProvider> {
  final _formKey = GlobalKey<FormState>();


  // List for the dropdown options
  final List<String> _stayOptions = ['Yes', 'No'];
  final List<String> _services = ['Babysitting', 'Housekeeping', 'Nursing'];


  final List<String> _languages = ['English', 'French'];
  final List<String> _nationalID = ['Yes', 'No'];


  TextEditingController fullNames = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController quarter = TextEditingController();
  TextEditingController profilePhotoUrl = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController yearsOfExperience = TextEditingController();
  TextEditingController homesWork = TextEditingController();


  String? _selectedLanguage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            'Provider Form',
          textAlign: TextAlign.center,
        ),
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
                  labelText: 'Enter your full names',
                  textInputType: TextInputType.text,
                  maxline: 1, hintText: 'John Doe',
                ),
                ProviderInputWidget(
                  controller: age,
                  labelText: 'Enter you Age',
                  textInputType: TextInputType.number,
                  maxline: 1, hintText: '25',
                ),

                ProviderInputWidget(
                  controller: quarter,
                  labelText: 'Enter you Quarter',
                  textInputType: TextInputType.text,
                  maxline: 1, hintText: 'Simbock',
                ),

                ProviderInputWidget(
                  controller: profilePhotoUrl,
                  labelText: 'Enter Photo Url',
                  textInputType: TextInputType.text,
                  maxline: 1, hintText: 'https:///',
                ),

                ProviderInputWidget(
                  controller: yearsOfExperience,
                  labelText: 'Years of Experience',
                  textInputType: TextInputType.text,
                  maxline: 1, hintText: '05',
                ),


                ProviderInputWidget(
                  controller: homesWork,
                  labelText: 'Homes Worked',
                  textInputType: TextInputType.text,
                  maxline: 1, hintText: '02',
                ),

                CustomDropdownWidget(
                    labelText: "Select your Langage",
                    items: _languages,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                  },
                    ),

                CustomDropdownWidget(
                  labelText: "Has National ID",
                  items: _nationalID,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value;
                    });
                  },
                ),

                CustomDropdownWidget(
                  labelText: "Stay Option",
                  items: _stayOptions,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value;
                    });
                  },
                ),

                CustomDropdownWidget(
                  labelText: "Type of Service",
                  items: _services,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value;
                    });
                  },
                ),

                ProviderInputWidget(
                  controller: profilePhotoUrl,
                  labelText: 'Description',
                  textInputType: TextInputType.text,
                  maxline: 4, hintText: 'I have over .........',
                ),

                FitnessButton(title: "Add", onTap: (){

                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

