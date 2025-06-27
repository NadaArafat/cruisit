class ExperienceModel {
  final int id;
  final String name;
  final String imgUrl;
  final String description;

  ExperienceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imgUrl,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      id: json['Id'] as int,
      name: json['Name'] as String,
      description: json['Description'] as String,
      imgUrl: json['ImgUrl'] as String,
    );
  }
}
