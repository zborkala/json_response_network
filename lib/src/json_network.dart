import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<Map?> get({String url = "", Map<String, String>? headers}) async {
  try {
    http.Response httpResponse =
        await http.get(Uri.parse(url), headers: headers);
    String responseData = httpResponse.body; //json
    var decodeResponseData = jsonDecode(responseData);
    
    return decodeResponseData;
  } catch (exp) {
    return null;
  }
}

Future<Map?> post(
    {String url = "",
    Map<String, String?>? body,
    Map<String, String>? headers}) async {
  var uri = Uri.parse(url);
  try {
    var response = await http.post(uri, body: body, headers: headers);
    var decodeResponseData = jsonDecode(response.body);
    
    return decodeResponseData;
  } catch (exp) {
    return null;
  }
}

Future<Map?> multipart(
    {var url,
    File? file,
    Map fields = const {},
    Map<String, String> headers = const {}}) async {
  var request = http.MultipartRequest("POST", url);
  for (var k in headers.keys) {
    request.headers[k] = "${headers[k]}";
  }
  for (var k in fields.keys) {
    request.fields[k] = fields[k];
  }
  request.files
      .add(http.MultipartFile.fromBytes('file', file!.readAsBytesSync()));
  request.send().then((response) {
    if (response.statusCode == 200) {
      return {'message': 'success'};
    }
  });
  return null;
}
