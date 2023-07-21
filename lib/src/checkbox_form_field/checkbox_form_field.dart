import 'package:flutter/material.dart';

import '../utills/constants/color_constants.dart';

part 'widgets/checkbox_widget.dart';
part 'helper_classes/checkbox_form_field_controller.dart';
part 'widgets/checkbox_row_widget.dart';

class CheckBoxFormField extends FormField<List<String>> {
  CheckBoxFormField(
      {super.key,
      required Map<String, String> values,
      required CheckBoxFormFieldController controller,
      String errorText = 'Please Select atleast one',
      String? Function(List<String>?)? validator,
      super.autovalidateMode = AutovalidateMode.disabled,
      super.enabled,
      super.onSaved})
      : super(validator: (val) {
          if (validator != null) return validator(val);
          if (val?.isEmpty ?? true) {
            return errorText;
          }
          return null;
        }, builder: (fieldState) {
          void onChangeHandler() {
            fieldState.didChange(controller.values);
          }

          return CheckBoxWidget(
            values: values,
            controller: controller,
            onChanged: onChangeHandler,
            fieldState: fieldState,
          );
        });
}
