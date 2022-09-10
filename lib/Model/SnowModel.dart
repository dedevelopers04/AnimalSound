// To parse this JSON data, do
//
//     final snowModel = snowModelFromJson(jsonString);

import 'dart:convert';

import 'dart:typed_data';

import 'package:animal_sound/Widget/ConvertUrlToByes.dart';

SnowModel snowModelFromJson(String str) => SnowModel.fromJson(json.decode(str));

String snowModelToJson(SnowModel data) => json.encode(data.toJson());

class SnowModel {
  String? type;
  Bear? bear;
  Bear? bluejay;
  Bear? fox;
  Bear? leopard;
  Bear? owl;
  Bear? penguin;
  Bear? rabbit;
  Bear? seal;
  Bear? squirrel;
  Bear? backgroundImage;
  Bear? image;

  SnowModel(
      {this.type,
        this.bear,
        this.bluejay,
        this.fox,
        this.leopard,
        this.owl,
        this.penguin,
        this.rabbit,
        this.seal,
        this.squirrel,
        this.backgroundImage,
        this.image});

  SnowModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    bear = json['Bear'] != null ? new Bear.fromJson(json['Bear']) : null;
    bluejay =
    json['Bluejay'] != null ? new Bear.fromJson(json['Bluejay']) : null;
    fox = json['Fox'] != null ? new Bear.fromJson(json['Fox']) : null;
    leopard =
    json['Leopard'] != null ? new Bear.fromJson(json['Leopard']) : null;
    owl = json['Owl'] != null ? new Bear.fromJson(json['Owl']) : null;
    penguin =
    json['Penguin'] != null ? new Bear.fromJson(json['Penguin']) : null;
    rabbit = json['Rabbit'] != null ? new Bear.fromJson(json['Rabbit']) : null;
    seal = json['Seal'] != null ? new Bear.fromJson(json['Seal']) : null;
    squirrel =
    json['Squirrel'] != null ? new Bear.fromJson(json['Squirrel']) : null;
    backgroundImage = json['Background Image'] != null
        ? new Bear.fromJson(json['Background Image'])
        : null;
    image = json['Image'] != null ? new Bear.fromJson(json['Image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.bear != null) {
      data['Bear'] = this.bear!.toJson();
    }
    if (this.bluejay != null) {
      data['Bluejay'] = this.bluejay!.toJson();
    }
    if (this.fox != null) {
      data['Fox'] = this.fox!.toJson();
    }
    if (this.leopard != null) {
      data['Leopard'] = this.leopard!.toJson();
    }
    if (this.owl != null) {
      data['Owl'] = this.owl!.toJson();
    }
    if (this.penguin != null) {
      data['Penguin'] = this.penguin!.toJson();
    }
    if (this.rabbit != null) {
      data['Rabbit'] = this.rabbit!.toJson();
    }
    if (this.seal != null) {
      data['Seal'] = this.seal!.toJson();
    }
    if (this.squirrel != null) {
      data['Squirrel'] = this.squirrel!.toJson();
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

class Bear {
  int? id;
  String? name;
  String? image;
  String? audio;
  Uint8List? audioL;
  Null? createdAt;
  Null? updatedAt;

  Bear(
      {this.id,
        this.name,
        this.image,
        this.audio,
        this.audioL,
        this.createdAt,
        this.updatedAt});

  Bear.fromJson(Map<String, dynamic> json) {
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