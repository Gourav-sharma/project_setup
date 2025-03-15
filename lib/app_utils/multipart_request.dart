import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class FormDataHelper {
  final Map<String, dynamic> _data = {};

  FormDataHelper();

  FormDataHelper addField(Map<String, dynamic> json) {
    json.forEach((key, value) {
      _data[key] = value;
    });
      return this;
    }

  Future<FormDataHelper> addFile(Map<String, dynamic> fileJson) async {
      var file = await MultipartFile.fromFile(
        fileJson['path'],
        filename: fileJson['fileName'],
        contentType: MediaType.parse(fileJson['contentType']),
      );
      _data[fileJson['key']] = file;
      return this;
    }

  Future<FormData> getRequestData({
    required bool isField,
    required bool isFile,
    required Map<String, dynamic> fieldData,
    required Map<String, dynamic> fileData
})  async {

    if(isFile==true && fieldData.isNotEmpty){
     await addFile(fileData);
     if(isField){
       addField(fieldData);
     }
    }

    return formData;
}

  Future<FormData> get formData async {
    return FormData.fromMap(_data);
  }

  @override
  String toString() {
    String dataString = 'MultipartRequestData{_data: {';
    _data.forEach((key, value) {
      if (value is Map && value.containsKey('file')) {
        var file = value['file'];
        dataString += '$key: {filename: ${file.filename}, '
            'contentType: ${file.contentType}, length: ${file.length}, '
            'filePath: ${value['filePath']}}, '; // Add filePath here
      } else {
        dataString += '$key: $value, ';
      }
    });
    if (_data.isNotEmpty) {
      dataString = dataString.substring(0, dataString.length - 2);
    }
    dataString += '}}';

    return dataString;
  }

  Map<String, dynamic> get data => _data;



}



