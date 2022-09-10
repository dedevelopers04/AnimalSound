import 'dart:typed_data';

import 'package:animal_sound/Widget/ConvertUrlToByes.dart';

class SecondCategory {
  SecondCategory({
    required this.type,
    required this.bull,
    required this.cat,
    required this.chicken,
    required this.cow,
    required this.dog,
    required this.donkey,
    required this.goat,
    required this.hourse,
    required this.lamb,
    required this.parrots,
    required this.pig,
    required this.pigeons,
    required this.raven,
    required this.rooster,
    required this.turkey,

  });
  late final String type;
  late final Bull bull;
  late final Cat cat;
  late final Chicken chicken;
  late final Cow cow;
  late final Dog dog;
  late final Donkey donkey;
  late final Goat goat;
  late final Hourse hourse;
  late final Lamb lamb;
  late final Parrots parrots;
  late final Pig pig;
  late final Pigeons pigeons;
  late final Raven raven;
  late final Rooster rooster;
  late final Turkey turkey;


  SecondCategory.fromJson(Map<String, dynamic> json){
    type = json['type'];
    bull = Bull.fromJson(json['Bull']);
    cat = Cat.fromJson(json['Cat']);
    chicken = Chicken.fromJson(json['Chicken']);
    cow = Cow.fromJson(json['Cow']);
    dog = Dog.fromJson(json['Dog']);
    donkey = Donkey.fromJson(json['Donkey']);
    goat = Goat.fromJson(json['Goat']);
    hourse = Hourse.fromJson(json['Hourse']);
    lamb = Lamb.fromJson(json['Lamb']);
    parrots = Parrots.fromJson(json['Parrots']);
    pig = Pig.fromJson(json['Pig']);
    pigeons = Pigeons.fromJson(json['Pigeons']);
    raven = Raven.fromJson(json['Raven']);
    rooster = Rooster.fromJson(json['Rooster']);
    turkey = Turkey.fromJson(json['Turkey']);

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['Bull'] = bull.toJson();
    _data['Cat'] = cat.toJson();
    _data['Chicken'] = chicken.toJson();
    _data['Cow'] = cow.toJson();
    _data['Dog'] = dog.toJson();
    _data['Donkey'] = donkey.toJson();
    _data['Goat'] = goat.toJson();
    _data['Hourse'] = hourse.toJson();
    _data['Lamb'] = lamb.toJson();
    _data['Parrots'] = parrots.toJson();
    _data['Pig'] = pig.toJson();
    _data['Pigeons'] = pigeons.toJson();
    _data['Raven'] = raven.toJson();
    _data['Rooster'] = rooster.toJson();
    _data['Turkey'] = turkey.toJson();

    return _data;
  }
}

class Bull {
  Bull({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String audio;
  late final Uint8List audioL;
  late final Null createdAt;
  late final Null updatedAt;

  Bull.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio= json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
    convertingData(audio);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }


  void convertingData(String aud) async{
   audioL= await ConvertBytes.instance.downloadFile(aud);
  }
}


class Cat {
  Cat({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String audio;
  late final Uint8List audioL;
  late final Null createdAt;
  late final Null updatedAt;

  Cat.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Chicken {
  Chicken({
    required this.id,
    required this.name,
    required this.image,

    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String audio;
  late final Uint8List audioL;
  late final Null createdAt;
  late final Null updatedAt;

  Chicken.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];

    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Cow {
  Cow({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final Uint8List audioL;
  late final String audio;
  late final Null createdAt;
  late final Null updatedAt;

  Cow.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;

    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Dog {
  Dog({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String audio;
  late final Uint8List audioL;
  late final Null createdAt;
  late final Null updatedAt;

  Dog.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Donkey {
  Donkey({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String audio;
  late final Uint8List audioL;
  late final Null createdAt;
  late final Null updatedAt;

  Donkey.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Goat {
  Goat({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final Uint8List audioL;
  late final String audio;
  late final Null createdAt;
  late final Null updatedAt;

  Goat.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Hourse {
  Hourse({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String audio;
  late final Uint8List audioL;
  late final Null createdAt;
  late final Null updatedAt;

  Hourse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }

  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Lamb {
  Lamb({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final Uint8List audioL;
  late final String audio;
  late final Null createdAt;
  late final Null updatedAt;

  Lamb.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }

  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Parrots {
  Parrots({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final Uint8List audioL;
  late final String audio;
  late final Null createdAt;
  late final Null updatedAt;

  Parrots.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Pig {
  Pig({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final Uint8List audioL;
  late final String audio;
  late final Null createdAt;
  late final Null updatedAt;

  Pig.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Pigeons {
  Pigeons({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String audio;
  late final Uint8List audioL;
  late final Null createdAt;
  late final Null updatedAt;

  Pigeons.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Raven {
  Raven({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String audio;
  late final Uint8List audioL;
  late final Null createdAt;
  late final Null updatedAt;

  Raven.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Rooster {
  Rooster({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String audio;
  late final Uint8List audioL;
  late final Null createdAt;
  late final Null updatedAt;

  Rooster.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }

  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Turkey {
  Turkey({
    required this.id,
    required this.name,
    required this.image,
    required this.audio,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String audio;
  late final Uint8List audioL;
  late final Null createdAt;
  late final Null updatedAt;

  Turkey.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    createdAt = null;
    updatedAt = null;
    if(audio!=null){
      convertingData(audio);
    }
  }
  void convertingData(String aud) async{
    audioL= await ConvertBytes.instance.downloadFile(aud);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

