import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';

Future<Map> getSingleRandomGif(String tag) async {
  http.Response response;
  response = await get(
      'https://api.giphy.com/v1/gifs/random?api_key=VmzfPdm1fy6NThTOSV6s2knV5F1h0fP6&tag=$tag&rating=G');
  return json.decode(response.body);
}

Future<Map> getGifsList(String search, int offset) async {
  http.Response response;
  if (search == '')
    response = await get(
        'https://api.giphy.com/v1/gifs/trending?api_key=VmzfPdm1fy6NThTOSV6s2knV5F1h0fP6&limit=26&rating=G');
  else
    response = await get(
        'https://api.giphy.com/v1/gifs/search?api_key=VmzfPdm1fy6NThTOSV6s2knV5F1h0fP6&q=$search&limit=25&offset=$offset&rating=G&lang=en');
  return json.decode(response.body);
}
