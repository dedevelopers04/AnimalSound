// To parse this JSON data, do
//
//     final desertModel = desertModelFromJson(jsonString);

import 'dart:convert';

import 'dart:typed_data';

import 'package:animal_sound/Widget/ConvertUrlToByes.dart';

DesertModel desertModelFromJson(String str) => DesertModel.fromJson(json.decode(str));

String desertModelToJson(DesertModel data) => json.encode(data.toJson());
class DesertModel {
  String? type;
  Camel? camel;
  Camel? cat;
  Camel? rat;
  Camel? snake1;
  Camel? snake2;
  Camel? tarantulas;
  Camel? thornydevil;
  Camel? vulture;
  Camel? yddax;
  Camel? backgroundImage;
  Camel? image;

  DesertModel(
      {this.type,
        this.camel,
        this.cat,
        this.rat,
        this.snake1,
        this.snake2,
        this.tarantulas,
        this.thornydevil,
        this.vulture,
        this.yddax,
        this.backgroundImage,
        this.image});

  DesertModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    camel = json['Camel'] != null ? new Camel.fromJson(json['Camel']) : null;
    cat = json['Cat'] != null ? new Camel.fromJson(json['Cat']) : null;
    rat = json['Rat'] != null ? new Camel.fromJson(json['Rat']) : null;
    snake1 = json['Snake1'] != null ? new Camel.fromJson(json['Snake1']) : null;
    snake2 = json['Snake2'] != null ? new Camel.fromJson(json['Snake2']) : null;
    tarantulas = json['Tarantulas'] != null
        ? new Camel.fromJson(json['Tarantulas'])
        : null;
    thornydevil = json['Thornydevil'] != null
        ? new Camel.fromJson(json['Thornydevil'])
        : null;
    vulture =
    json['Vulture'] != null ? new Camel.fromJson(json['Vulture']) : null;
    yddax = json['Yddax'] != null ? new Camel.fromJson(json['Yddax']) : null;
    backgroundImage = json['Background Image'] != null
        ? new Camel.fromJson(json['Background Image'])
        : null;
    image = json['Image'] != null ? new Camel.fromJson(json['Image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.camel != null) {
      data['Camel'] = this.camel!.toJson();
    }
    if (this.cat != null) {
      data['Cat'] = this.cat!.toJson();
    }
    if (this.rat != null) {
      data['Rat'] = this.rat!.toJson();
    }
    if (this.snake1 != null) {
      data['Snake1'] = this.snake1!.toJson();
    }
    if (this.snake2 != null) {
      data['Snake2'] = this.snake2!.toJson();
    }
    if (this.tarantulas != null) {
      data['Tarantulas'] = this.tarantulas!.toJson();
    }
    if (this.thornydevil != null) {
      data['Thornydevil'] = this.thornydevil!.toJson();
    }
    if (this.vulture != null) {
      data['Vulture'] = this.vulture!.toJson();
    }
    if (this.yddax != null) {
      data['Yddax'] = this.yddax!.toJson();
    }
    if (this.backgroundImage != null) {
      data['Background Image'] = this.backgroundImage!.toJson();
    }
    if (this.image != null) {
      data['Image'] = this.image!.toJson();
    }
    return data;
  }
}

class Camel {
  int? id;
  String? name;
  String? image;
  String? audio;
  Uint8List? audioL;
  Null? createdAt;
  Null? updatedAt;

  Camel(
      {this.id,
        this.name,
        this.image,
        this.audio,
        this.audioL,
        this.createdAt,
        this.updatedAt});

  Camel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if(audio!=null){
      convertingData(audio!);
    }
  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['audio'] = this.audio;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}