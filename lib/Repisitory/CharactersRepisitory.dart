import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Results>> getData(int page) async {
  List<Results> list;

  String url = "https://rickandmortyapi.com/api/character?";
  var res = await http.get(Uri.parse("${url}page=$page"));
  var data = json.decode(res.body);

  var rest = data["results"] as List;

  list = rest.map<Results>((json) => Results.fromJson(json)).toList();

  return list;
}

class Results {
  String image;
  String name;
  String status;
  String type;
  String gender;
  String species;
  Origin origin;
  Location location;
  Results({
    required this.image,
    required this.name,
    required this.status,
    required this.gender,
    required this.species,
    required this.origin,
    required this.location,
    required this.type,
  });
  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      image: json['image'],
      name: json['name'],
      status: json['status'],
      gender: json['gender'],
      species: json['species'],
      type: json['type'],
      origin: Origin.fromJson(json['origin']),
      location: Location.fromJson(json['location']),
    );
  }
}

class Origin {
  String name;
  Origin({required this.name});
  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'],
    );
  }
}

class Location {
  String name;
  Location({required this.name});
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(name: json['name']);
  }
}
