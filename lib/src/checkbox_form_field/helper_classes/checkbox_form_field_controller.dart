part of '../checkbox_form_field.dart';

class CheckBoxFormFieldController extends ValueNotifier<List<dynamic>> {
  CheckBoxFormFieldController({List<dynamic>? values})
      : super(values ?? <dynamic>[]);
  List<dynamic> get values => super.value;

  void clear() {
    super.value.clear();
    notifyListeners();
  }
}
