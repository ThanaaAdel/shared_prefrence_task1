class LoginRequestModel {
  final String? name;
  final DateTime? birthDate;

  LoginRequestModel(
     this.name,
     this.birthDate,
  );

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    // Parse the birthDate string into a DateTime object
    DateTime birthDate = DateTime.tryParse(json['birthDate'] as String) ?? DateTime.now();

    return LoginRequestModel(
      json['name'] as String,
      birthDate,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    // Convert the DateTime object back to a string representation for JSON
    data['birthDate'] = birthDate!.toIso8601String(); // or any other desired format
    return data;
  }
}
