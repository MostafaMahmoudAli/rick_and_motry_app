// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

CharacterModel characterModelFromJson(String str) => CharacterModel.fromJson(json.decode(str));

String characterModelToJson(CharacterModel data) => json.encode(data.toJson());

class CharacterModel {
  Info? info;
  List<Result>? results;

  CharacterModel({
    this.info,
    this.results,
  });

  CharacterModel copyWith({
    Info? info,
    List<Result>? results,
  }) =>
      CharacterModel(
        info: info ?? this.info,
        results: results ?? this.results,
      );

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
    info: json["info"] == null ? null : Info.fromJson(json["info"]),
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info?.toJson(),
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Info {
  int? count;
  int? pages;
  String? next;
  dynamic prev;

  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  Info copyWith({
    int? count,
    int? pages,
    String? next,
    dynamic prev,
  }) =>
      Info(
        count: count ?? this.count,
        pages: pages ?? this.pages,
        next: next ?? this.next,
        prev: prev ?? this.prev,
      );

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}

class Result {
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

  Result({
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

  Result copyWith({
    int? id,
    String? name,
    Status? status,
    Species? species,
    String? type,
    Gender? gender,
    Location? origin,
    Location? location,
    String? image,
    List<String>? episode,
    String? url,
    DateTime? created,
  }) =>
      Result(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        species: species ?? this.species,
        type: type ?? this.type,
        gender: gender ?? this.gender,
        origin: origin ?? this.origin,
        location: location ?? this.location,
        image: image ?? this.image,
        episode: episode ?? this.episode,
        url: url ?? this.url,
        created: created ?? this.created,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": statusValues.reverse[status],
    "species": speciesValues.reverse[species],
    "type": type,
    "gender": genderValues.reverse[gender],
    "origin": origin?.toJson(),
    "location": location?.toJson(),
    "image": image,
    "episode": episode == null ? [] : List<dynamic>.from(episode!.map((x) => x)),
    "url": url,
    "created": created?.toIso8601String(),
  };
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

  Location copyWith({
    String? name,
    String? url,
  }) =>
      Location(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
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
