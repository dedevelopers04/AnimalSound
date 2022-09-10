import 'dart:typed_data';

import 'package:animal_sound/Widget/ConvertUrlToByes.dart';

class ThirdCategory {
  ThirdCategory({
    required this.type,
    required this.crow,
    required this.gorilla,
    required this.grasshopper,
    required this.leopard,
    required this.lion,
    required this.owl,
    required this.rhinozerus,
    required this.schimpanse,
    required this.tiger,
    required this.wolf,
    });
  late final String type;
  late final Crow crow;
  late final Gorilla gorilla;
  late final Grasshopper grasshopper;
  late final Leopard leopard;
  late final Lion lion;
  late final Owl owl;
  late final Rhinozerus rhinozerus;
  late final Schimpanse schimpanse;
  late final Tiger tiger;
  late final Wolf wolf;

  ThirdCategory.fromJson(Map<String, dynamic> json){
    type = json['type'];
    crow = Crow.fromJson(json['Crow']);
    gorilla = Gorilla.fromJson(json['Gorilla']);
    grasshopper = Grasshopper.fromJson(json['Grasshopper']);
    leopard = Leopard.fromJson(json['Leopard']);
    lion = Lion.fromJson(json['Lion']);
    owl = Owl.fromJson(json['Owl']);
    rhinozerus = Rhinozerus.fromJson(json['Rhinozerus']);
    schimpanse = Schimpanse.fromJson(json['Schimpanse']);
    tiger = Tiger.fromJson(json['Tiger']);
    wolf = Wolf.fromJson(json['Wolf']);
   }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['Crow'] = crow.toJson();
    _data['Gorilla'] = gorilla.toJson();
    _data['Grasshopper'] = grasshopper.toJson();
    _data['Leopard'] = leopard.toJson();
    _data['Lion'] = lion.toJson();
    _data['Owl'] = owl.toJson();
    _data['Rhinozerus'] = rhinozerus.toJson();
    _data['Schimpanse'] = schimpanse.toJson();
    _data['Tiger'] = tiger.toJson();
    _data['Wolf'] = wolf.toJson();
    return _data;
  }
}

class Crow {
  Crow({
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

  Crow.fromJson(Map<String, dynamic> json){
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

class Gorilla {
  Gorilla({
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

  Gorilla.fromJson(Map<String, dynamic> json){
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

class Grasshopper {
  Grasshopper({
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

  Grasshopper.fromJson(Map<String, dynamic> json){
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

class Leopard {
  Leopard({
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

  Leopard.fromJson(Map<String, dynamic> json){
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

class Lion {
  Lion({
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

  Lion.fromJson(Map<String, dynamic> json){
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

class Owl {
  Owl({
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

  Owl.fromJson(Map<String, dynamic> json){
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

class Rhinozerus {
  Rhinozerus({
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

  Rhinozerus.fromJson(Map<String, dynamic> json){
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

class Schimpanse {
  Schimpanse({
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

  Schimpanse.fromJson(Map<String, dynamic> json){
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

class Tiger {
  Tiger({
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

  Tiger.fromJson(Map<String, dynamic> json){
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

class Wolf {
  Wolf({
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

  Wolf.fromJson(Map<String, dynamic> json){
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
