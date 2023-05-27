
enum DiseaseType {
  stomach,
  brain
}

class DiseaseCategory {
  String title;
  DiseaseType type;

  DiseaseCategory(this.title, this.type);
}