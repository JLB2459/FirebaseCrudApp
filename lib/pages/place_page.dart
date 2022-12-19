import 'package:apiapp/providers/place_provider.dart';
import 'package:apiapp/services/place_service.dart';
import 'package:apiapp/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final placeService = Provider.of<PlaceService>(context);
    return ChangeNotifierProvider(
      create: (_) => PlaceFormProvider(placeService.selectPlace),
      child: _PlaceFormWidget(placeService: placeService),
    );
  }
}

class _PlaceFormWidget extends StatelessWidget {
  final PlaceService placeService;
  const _PlaceFormWidget({
    required this.placeService,
  });

  @override
  Widget build(BuildContext context) {
    final placeForm = Provider.of<PlaceFormProvider>(context);
    final dato = placeForm.place;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares'),
      ),
      body: Form(
        key: placeForm.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
              .copyWith(bottom: 0),
          child: Column(
            children: [
              CustomTextFormField(
                initialValue: dato.nombre,
                hintText: 'Lugar',
                onChanged: (value) => dato.nombre = value,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                initialValue: dato.descripcion,
                maxLines: 5,
                hintText: 'Descripción del lugar',
                onChanged: (value) => dato.descripcion = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveOrCreatePlace(placeForm, context);
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  void saveOrCreatePlace(PlaceFormProvider placeForm, BuildContext context) {
    placeService.saveOrCreatePlace(placeForm.place);
    Navigator.maybePop(context);
  }
}
