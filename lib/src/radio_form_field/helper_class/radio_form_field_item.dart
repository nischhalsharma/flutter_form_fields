part of '../radio_form_field.dart';

class RadioFormFieldItem<T> {
  RadioFormFieldItem({required this.hintText, required this.value});
  final String hintText;
  final T value;
}
