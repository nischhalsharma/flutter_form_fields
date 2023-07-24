part of '../radio_form_field.dart';

class RadioFormFieldController extends ValueNotifier<dynamic> {
  RadioFormFieldController({dynamic value}) : super(value);
  dynamic get selectedValue => super.value;
  late Map<String, dynamic> _internalMap;
  void _internalKeyValue(Map<String, dynamic> values) {
    _internalMap =
        values.map((key, value) => MapEntry(value.toString(), value));
  }

  void clear() {
    super.value = null;
    notifyListeners();
  }
}
