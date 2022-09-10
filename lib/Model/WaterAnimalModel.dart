import 'dart:typed_data';

import 'package:animal_sound/Widget/ConvertUrlToByes.dart';

class WaterAnimalModel {
  String? type;
  Dolphin? dolphin;
  Dolphin? octopus;
  Dolphin? scorpions;
  Dolphin? seahorse;
  Dolphin? sealion;
  Dolphin? shark;
  Dolphin? snail;
  Dolphin? star1;
  Dolphin? star2;
  Dolphin? stone1;
  Dolphin? stone2;
  Dolphin? turtle;
  Dolphin? whale;

  WaterAnimalModel(
      {this.type,
        this.dolphin,
        this.octopus,
        this.scorpions,
        this.seahorse,
        this.sealion,
        this.shark,
        this.snail,
        this.star1,
        this.star2,
        this.stone1,
        this.stone2,
        this.turtle,
        this.whale});

  WaterAnimalModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    dolphin =
    json['Dolphin'] != null ? new Dolphin.fromJson(json['Dolphin']) : null;
    octopus =
    json['Octopus'] != null ? new Dolphin.fromJson(json['Octopus']) : null;
    scorpions = json['Scorpions'] != null
        ? new Dolphin.fromJson(json['Scorpions'])
        : null;
    seahorse = json['Seahorse'] != null
        ? new Dolphin.fromJson(json['Seahorse'])
        : null;
    sealion =
    json['Sealion'] != null ? new Dolphin.fromJson(json['Sealion']) : null;
    shark = json['Shark'] != null ? new Dolphin.fromJson(json['Shark']) : null;
    snail = json['Snail'] != null ? new Dolphin.fromJson(json['Snail']) : null;
    star1 = json['Star1'] != null ? new Dolphin.fromJson(json['Star1']) : null;
    star2 = json['Star2'] != null ? new Dolphin.fromJson(json['Star2']) : null;
    stone1 =
    json['Stone1'] != null ? new Dolphin.fromJson(json['Stone1']) : null;
    stone2 =
    json['Stone2'] != null ? new Dolphin.fromJson(json['Stone2']) : null;
    turtle =
    json['Turtle'] != null ? new Dolphin.fromJson(json['Turtle']) : null;
    whale = json['Whale'] != null ? new Dolphin.fromJson(json['Whale']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.dolphin != null) {
      data['Dolphin'] = this.dolphin!.toJson();
    }
    if (this.octopus != null) {
      data['Octopus'] = this.octopus!.toJson();
    }
    if (this.scorpions != null) {
      data['Scorpions'] = this.scorpions!.toJson();
    }
    if (this.seahorse != null) {
      data['Seahorse'] = this.seahorse!.toJson();
    }
    if (this.sealion != null) {
      data['Sealion'] = this.sealion!.toJson();
    }
    if (this.shark != null) {
      data['Shark'] = this.shark!.toJson();
    }
    if (this.snail != null) {
      data['Snail'] = this.snail!.toJson();
    }
    if (this.star1 != null) {
      data['Star1'] = this.star1!.toJson();
    }
    if (this.star2 != null) {
      data['Star2'] = this.star2!.toJson();
    }
    if (this.stone1 != null) {
      data['Stone1'] = this.stone1!.toJson();
    }
    if (this.stone2 != null) {
      data['Stone2'] = this.stone2!.toJson();
    }
    if (this.turtle != null) {
      data['Turtle'] = this.turtle!.toJson();
    }
    if (this.whale != null) {
      data['Whale'] = this.whale!.toJson();
    }
    return data;
  }
}

class Dolphin {
  int? id;
  String? name;
  String? image;
  String? audio;
  Uint8List? audioL;
  Null? createdAt;
  Null? updatedAt;

  Dolphin(
      {this.id,
        this.name,
        this.image,
        this.audio,
        this.audioL,
        this.createdAt,
        this.updatedAt});

  Dolphin.fromJson(Map<String, dynamic> json) {
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