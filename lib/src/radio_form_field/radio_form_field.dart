import 'package:flutter/material.dart';

import '../utills/constants/color_constants.dart';

part 'widget/radio_row_widget.dart';
part 'widget/radio_widget.dart';

/// [RadioFormField] is a widget that can let user to select on option from a group of [Radio] widgets.
/// Along with that a validator function can be provided in order to validate the input.
class RadioFormField extends FormField<String> {
  RadioFormField({
    super.key,
    super.onSaved,
    super.enabled = true,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,

    /// Validator function determines if the input in the field is valid or not. return null if valid else return a string that can be display to  the user.
    String? Function(String? val)? validator,
    required ValueNotifier<String> radioValue,

    /// The [values] parameter assigns the value to the radioValue.value according t0 the user input
    List<String> values = const ["yes", "no"],

    /// The [title] parameter are the List of Strings that are visible on the UI.
    List<String> titles = const ["Yes", "No"],

    /// The callback function will we called when the imput changes
    Function? callback,

    /// When the input is invalid the [errorText] will be shown, if don,t have any value then default error text will be shown.
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
