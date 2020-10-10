import 'dart:convert';

PokemonModel welcomeFromJson(String str) => PokemonModel.fromJson(json.decode(str));

String welcomeToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
    PokemonModel({
        this.baseExperience,
        this.height,
        this.id,
        this.locationAreaEncounters,
        this.name,
        this.order,
        this.sprites,
        this.weight,
    });

    int baseExperience;
    int height;
    int id;
    String locationAreaEncounters;
    String name;
    int order;
    Sprites sprites;
    int weight;

    factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        locationAreaEncounters: json["location_area_encounters"],
        name: json["name"],
        order: json["order"],
        sprites: Sprites.fromJson(json["sprites"]),
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "location_area_encounters": locationAreaEncounters,
        "name": name,
        "order": order,
        "sprites": sprites.toJson(),
        "weight": weight,
    };
}

class Sprites {
    Sprites({
        this.other,
    });

    Other other;

    factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
    );

    Map<String, dynamic> toJson() => {
        "other": other == null ? null : other.toJson(),
    };
}

class Other {
    Other({
        this.officialArtwork,
    });

    OfficialArtwork officialArtwork;

    factory Other.fromJson(Map<String, dynamic> json) => Other(
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
    );

    Map<String, dynamic> toJson() => {
        "official-artwork": officialArtwork.toJson(),
    };
}

class OfficialArtwork {
    OfficialArtwork({
        this.frontDefault,
    });

    String frontDefault;

    factory OfficialArtwork.fromJson(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
    };
}