

class Characters {
  List<Character>? results;

  Characters({
    this.results,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
    results: json["results"] == null ? [] : List<Character>.from(json["results"]!.map((x) => Character.fromJson(x))),
  );

}

class Character {
  int? id;
  String? name;
  Status? status;
  Species? species;
  String? type;
  Gender? gender;
  Location? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json["id"],
    name: json["name"],
    status: statusValues.map[json["status"]]!,
    species: speciesValues.map[json["species"]]!,
    type: json["type"],
    gender: genderValues.map[json["gender"]]!,
    origin: json["origin"] == null ? null : Location.fromJson(json["origin"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    image: json["image"],
    episode: json["episode"] == null ? [] : List<String>.from(json["episode"]!.map((x) => x)),
    url: json["url"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
  );

}

enum Gender { MALE, FEMALE, UNKNOWN }

final genderValues = EnumValues({
  "Female": Gender.FEMALE,
  "Male": Gender.MALE,
  "unknown": Gender.UNKNOWN
});

class Location {
  String? name;
  String? url;

  Location({
    this.name,
    this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    url: json["url"],
  );
}

enum Species { HUMAN, ALIEN }

final speciesValues = EnumValues({
  "Alien": Species.ALIEN,
  "Human": Species.HUMAN
});

enum Status { ALIVE, UNKNOWN, DEAD }

final statusValues = EnumValues({
  "Alive": Status.ALIVE,
  "Dead": Status.DEAD,
  "unknown": Status.UNKNOWN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
