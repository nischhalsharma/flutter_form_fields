part of '../checkbox_form_field.dart';

class CheckBoxFormFieldController<T> extends ValueNotifier<List<T>> {
  CheckBoxFormFieldController({List<T>? values}) : super(values ?? <T>[]);
  List<T> get values => super.value;

  void clear() {
    super.value.clear();
    notifyListeners();
  }
}
