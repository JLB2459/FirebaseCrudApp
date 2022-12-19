import 'package:apiapp/models/place.dart';
import 'package:apiapp/services/place_service.dart';
import 'package:apiapp/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final placesService = Provider.of<PlaceService>(context);

    if (placesService.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: placesService.places.length,
        itemBuilder: (BuildContext context, int index) {
          final place = placesService.places[index];

          return CardCustom(
            title: Text(
              place.nombre,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              place.descripcion,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
            updateOnPressed: () {
              _updatePlace(placesService, context, index);
            },
            deleteOnPressed: () {
              _deletePlace(placesService, place);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addPlace(placesService, context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addPlace(PlaceService placesService, BuildContext context) {
    placesService.selectPlace = Place(descripcion: '', nombre: '');
    Navigator.pushNamed(context, 'place_page');
  }

  void _deletePlace(PlaceService placesService, Place place) {
    placesService.deletePlace(place);
    print(place.id);
  }

  void _updatePlace(
      PlaceService placesService, BuildContext context, int index) {
    placesService.selectPlace = placesService.places[index].copyWith();

    Navigator.pushNamed(context, 'place_page');
  }
}
