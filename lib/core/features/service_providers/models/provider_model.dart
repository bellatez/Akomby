class ProviderModel {
  final String fullName;
  final int age;
  final String quarter;
  final String language;
  final String stayOption;
  final String typeOfService;
  final String profilePhotoUrl;
  final String description;
  final int yearsOfExperience; // New field
  final int homesWorked;       // New field
  final bool hasNationalID;    // New field

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

  factory ProviderModel.fromJson(Map<String, dynamic> json){
    return ProviderModel(
        fullName: json['fullName'],
        age: json['age'],
        quarter: json['quarter'],
        language: json['language'],
        stayOption: json['stayOption'],
        typeOfService: json['typeOfService'],
        profilePhotoUrl: json['profilePhotoUrl'],
        description: json['description'],
        yearsOfExperience: json['yearsOfExperience'],
        homesWorked: json['homesWorked'],
        hasNationalID: json['hasNationalID']
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'age': age,
      'quarter': quarter,
      'language': language,
      'stayOption': stayOption,
      'typeOfService': typeOfService,
      'profilePhotoUrl': profilePhotoUrl,
      'description': description,
      'yearsOfExperience': yearsOfExperience,
      'homesWorked': homesWorked,
      'hasNationalID': hasNationalID,
    };
  }
}