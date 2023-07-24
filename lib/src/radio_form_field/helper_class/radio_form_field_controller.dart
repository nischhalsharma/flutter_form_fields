part of '../radio_form_field.dart';

class RadioFormFieldController<T> extends ValueNotifier<T?> {
  RadioFormFieldController({T? value}) : super(value);
  T? get selectedValue => super.value;

  void clear() {
    super.value = null;
    notifyListeners();
  }
}
