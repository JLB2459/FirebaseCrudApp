import 'package:apiapp/models/place.dart';
import 'package:flutter/material.dart';

class PlaceFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Place place;

  PlaceFormProvider(this.place);
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
