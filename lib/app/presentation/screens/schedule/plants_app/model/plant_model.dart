class PlantModel {
  final String plantName;
  final String baseImageUrl;
  final String imageUrl;
  final List<PlantDetailModel> description;

  PlantModel({
    required this.imageUrl,
    required this.baseImageUrl,
    required this.plantName,
    required this.description,
  });
}

class PlantDetailModel {
  final String title;
  final String substitute;

  PlantDetailModel({
    required this.title,
    required this.substitute,
  });
}
