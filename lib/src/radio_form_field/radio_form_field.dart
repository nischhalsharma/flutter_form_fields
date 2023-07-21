import 'package:flutter/material.dart';

import '../utills/constants/color_constants.dart';

part 'widget/radio_row_widget.dart';
part 'widget/radio_widget.dart';

class RadioFormField extends FormField<String> {
  RadioFormField({
    super.key,
    super.onSaved,
    super.enabled = true,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,
    String? Function(String? val)? validator,
    required ValueNotifier<String> radioValue,
    List<String> values = const ["yes", "no"],
    List<String> titles = const ["Yes", "No"],
    Function? callback,
    String errorText = "Please select a value",
  }) : super(validator: (val) {
          if (validator != null) return validator(val);
          if (val?.isEmpty ?? true) {
            return errorText;
          }
          return null;
        }, builder: (FormFieldState<String> fieldState) {
          void onChangehandler() {
            fieldState.didChange(radioValue.value);
            if (callback != null) callback();
          }

          return RadioWidget(
            fieldState: fieldState,
            radioValue,
            callback: onChangehandler,
            titles: titles,
            values: values,
          );
        });
}
