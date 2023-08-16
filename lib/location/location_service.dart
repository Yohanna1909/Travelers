// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService{
  final String key='AIzaSyDCliSywpl0YKu2K9cvkOIKAkhqWsVwsec';
  
  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);

    if (json['candidates'] != null && json['candidates'].isNotEmpty) {
      var placeId = json['candidates'][0]['place_id'] as String;
      print(placeId);
      return placeId;
    } else {
      throw Exception('No candidates found.');
    }
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);

    if (json['result'] != null) {
      var results = json['result'] as Map<String, dynamic>;
      print(results);
      return results;
    } else {
      throw Exception('No result found.');
    }
  }
}