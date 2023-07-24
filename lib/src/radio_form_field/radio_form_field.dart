import 'package:flutter/material.dart';

import '../utills/constants/color_constants.dart';
part 'helper_class/radio_form_field_controller.dart';
part 'widget/radio_row_widget.dart';
part 'widget/radio_widget.dart';

/// [RadioFormField] is a widget that can let user to select on option from a group of [Radio] widgets.
/// Along with that a validator function can be provided in order to validate the input.
class RadioFormField extends FormField<String> {
  RadioFormField({
    super.key,
    super.onSaved,
    super.enabled = true,
    super.autovalidateMode = AutovalidateMode.disabled,
    required final String titleText,
    TextStyle? titleTextStyle,

    /// Validator function determines if the input in the field is valid or not. return null if valid else return a string that can be display to  the user.
    String? Function(String? val)? validator,
    required RadioFormFieldController controller,

    /// The [values] parameter assigns the value to the radioValue.value according t0 the user input

    Map<String, String> values = const {"Yes": "yes", "No": "no"},

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
            fieldState.didChange(controller.value);
            if (callback != null) callback();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                titleText,
                style: titleTextStyle,
              ),
              RadioWidget(
                fieldState: fieldState,
                controller,
                callback: onChangehandler,
                values: values,
              ),
            ],
          );
        });
}
