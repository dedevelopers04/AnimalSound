
import 'dart:typed_data';

import 'package:animal_sound/Widget/ConvertUrlToByes.dart';

class FirstCategory {
  FirstCategory({
    required this.type,
    required this.alligator,
    required this.bison,
    required this.cobra,
    required this.coyotes,
    required this.elephant,
    required this.elk,
    required this.frog,
    required this.geier,
    required this.monkey,
    required this.rebit,
  });
  late final String type;
  late final Alligator alligator;
  late final Bison bison;
  late final Cobra cobra;
  late final Coyotes coyotes;
  late final Elephant elephant;
  late final Elk elk;
  late final Frog frog;
  late final Geier geier;
  late final Monkey monkey;
  late final Rebit rebit;

  FirstCategory.fromJson(Map<String, dynamic> json){
    type = json['type'];
    alligator = Alligator.fromJson(json['Alligator']);
    bison = Bison.fromJson(json['Bison']);
    cobra = Cobra.fromJson(json['Cobra']);
    coyotes = Coyotes.fromJson(json['Coyotes']);
    elephant = Elephant.fromJson(json['Elephant']);
    elk = Elk.fromJson(json['Elk']);
    frog = Frog.fromJson(json['Frog']);
    geier = Geier.fromJson(json['Geier']);
    monkey = Monkey.fromJson(json['Monkey']);
    rebit = Rebit.fromJson(json['Rebit']);

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['Alligator'] = alligator.toJson();
    _data['Bison'] = bison.toJson();
    _data['Cobra'] = cobra.toJson();
    _data['Coyotes'] = coyotes.toJson();
    _data['Elephant'] = elephant.toJson();
    _data['Elk'] = elk.toJson();
    _data['Frog'] = frog.toJson();
    _data['Geier'] = geier.toJson();
    _data['Monkey'] = monkey.toJson();
    _data['Rebit'] = rebit.toJson();
    return _data;
  }
}

class Alligator {
  Alligator({
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

  Alligator.fromJson(Map<String, dynamic> json){
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

class Bison {
  Bison({
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

  Bison.fromJson(Map<String, dynamic> json){
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

class Cobra {
  Cobra({
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

  Cobra.fromJson(Map<String, dynamic> json){
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

class Coyotes {
  Coyotes({
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

  Coyotes.fromJson(Map<String, dynamic> json){
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

class Elephant {
  Elephant({
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

  Elephant.fromJson(Map<String, dynamic> json){
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

class Elk {
  Elk({
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

  Elk.fromJson(Map<String, dynamic> json){
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

class Frog {
  Frog({
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

  Frog.fromJson(Map<String, dynamic> json){
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

class Geier {
  Geier({
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

  Geier.fromJson(Map<String, dynamic> json){
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
    late final Uint8List audioL;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Monkey {
  Monkey({
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

  Monkey.fromJson(Map<String, dynamic> json){
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

class Rebit {
  Rebit({
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

  Rebit.fromJson(Map<String, dynamic> json){
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

