part of '../checkbox_form_field.dart';

class CheckBoxFormFieldController extends ValueNotifier<List<String>> {
  CheckBoxFormFieldController({List<String>? values})
      : super(values ?? <String>[]);
  List<String> get values => super.value;

  void clear() {
    super.value.clear();
    notifyListeners();
  }
}
