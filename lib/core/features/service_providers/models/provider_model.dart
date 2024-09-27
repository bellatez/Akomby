class ProviderModel {
  String fullName;
  int age;
  String quarter;
  String language;
  String stayOption;
  String typeOfService;
  String profilePhotoUrl;
  String description;
  int yearsOfExperience; // New field
  int homesWorked;       // New field
  bool hasNationalID;    // New field

  ProviderModel({
    required this.fullName,
    required this.age,
    required this.quarter,
    required this.language,
    required this.stayOption,
    required this.typeOfService,
    required this.profilePhotoUrl,
    required this.description,
    required this.yearsOfExperience, // New field
    required this.homesWorked,       // New field
    required this.hasNationalID,      // New field
  });
}