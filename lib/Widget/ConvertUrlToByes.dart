import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ConvertBytes{
  ConvertBytes._privateConstructor();
  static final ConvertBytes _convertBytes = ConvertBytes._privateConstructor();
  static ConvertBytes get instance {
    return _convertBytes;
  }
  Future<Uint8List> downloadFile(String url) async {
   // String dir = (await getApplicationDocumentsDirectory()).path;
   // File file = new File('$dir/audio.mp3');
    var request = await http.get(Uri.parse(url));

    var bytes =  request.bodyBytes;//close();
   // await file.writeAsBytes(bytes);
   // Uint8List bytes =file.readAsBytesSync();
  //  print(file.path);
    //String bytesStr=bytes.toString();
    return bytes;
  }
}