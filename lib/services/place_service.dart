import 'dart:convert';
import 'package:apiapp/models/place.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlaceService extends ChangeNotifier {
  final String baseUrl =
      'https://api-flutter-c97d2-default-rtdb.firebaseio.com';
  final List<Place> places = [];
  late Place selectPlace;

  bool isLoading = true;
  bool isSaving = false;

  PlaceService() {
    showPlaces();
  }

  Future<List<Place>> showPlaces() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('$baseUrl/lugar.json');
    final response = await http.get(url);

    final Map<String, dynamic> placesMap = json.decode(response.body);

    placesMap.forEach((key, value) {
      final temporalPlace = Place.fromMap(value);
      temporalPlace.id = key;
      places.add(temporalPlace);
    });

    isLoading = false;
    notifyListeners();
    return places;
  }

  //validated if requires create or update
  Future saveOrCreatePlace(Place place) async {
    isSaving = true;
    notifyListeners();
    if (place.id == null) {
      await createPlace(place);
    } else {
      await updatePlace(place);
    }
    isSaving = false;
    notifyListeners();
  }

  //Update place
  Future<String> updatePlace(Place place) async {
    final url = Uri.parse('$baseUrl/lugar/${place.id}.json');
    final response = await http.put(url, body: place.toJson());
    final decodeData = response.body;
    print(decodeData);
    final index = places.indexWhere((element) => element.id == place.id);
    places[index] = place;
    return place.id!;
  }

  //Create place
  Future<String> createPlace(Place place) async {
    final url = Uri.parse('$baseUrl/lugar.json');
    final response = await http.post(url, body: place.toJson());

    final decodedData = json.decode(response.body);
    place.id = decodedData['name'];
    places.add(place);

    return place.id!;
  }

  //Delete place
  Future<void> deletePlace(Place place) async {
    final url = Uri.parse('$baseUrl/lugar/${place.id}.json');
    final response = await http.delete(url);
    places.remove(place);
    notifyListeners();
    print(response.body);
  }
}
