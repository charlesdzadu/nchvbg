class UsefulContact {
  String? name;
  String? description;

  List<Structure>? structures;

  UsefulContact();

  factory UsefulContact.fromJson(Map<String, dynamic> data) {
    return UsefulContact()
      ..name = data['name']
      ..description = data['description']
      ..structures = (data['structures'] as List<dynamic>)
          .map((e) => Structure.fromJson(e as Map<String, dynamic>))
          .toList();
  }
}

class Structure {
  String? name;
  String? adresse;
  String? description;
  List<dynamic>? contacts;

  Structure();

  factory Structure.fromJson(Map<String, dynamic> data) {
    return Structure()
      ..name = data['name']
      ..adresse = data["adresse"]
      ..description = data['description']
      ..contacts = data['contacts'];
  }
}
