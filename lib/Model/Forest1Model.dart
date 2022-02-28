// To parse this JSON data, do
//
//     final forest1Model = forest1ModelFromJson(jsonString);

import 'dart:convert';

Forest1Model forest1ModelFromJson(String str) => Forest1Model.fromJson(json.decode(str));

String forest1ModelToJson(Forest1Model data) => json.encode(data.toJson());

class Forest1Model {
  Forest1Model({
    this.items,
  });

  List<Item>? items;

  factory Forest1Model.fromJson(Map<String, dynamic> json) => Forest1Model(
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.category,
    this.id,
    this.image,
    this.name,
    this.audio,
  });

  String? category;
  int? id;
  String? image;
  String? name;
  String? audio;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    category: json["category"] == null ? null : json["category"],
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    name: json["name"] == null ? null : json["name"],
    audio: json["audio"] == null ? null : json["audio"],
  );

  Map<String, dynamic> toJson() => {
    "category": category == null ? null : category,
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "name": name == null ? null : name,
    "audio": audio == null ? null : audio,
  };
}

