part of '../radio_form_field.dart';

class RadioFormFieldController extends ValueNotifier<dynamic> {
  RadioFormFieldController({dynamic value}) : super(value);
  String get selectedValue => super.value;
  void clear() {
    super.value = null;
    notifyListeners();
  }
}
