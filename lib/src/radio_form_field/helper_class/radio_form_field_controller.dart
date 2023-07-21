part of '../radio_form_field.dart';

class RadioFormFieldController extends ValueNotifier<String> {
  RadioFormFieldController({String? value}) : super(value ?? '');
  String get selectedValue => super.value;
  void clear() {
    super.value = '';
    notifyListeners();
  }
}
