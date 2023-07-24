import 'package:flutter/material.dart';

import '../utills/constants/color_constants.dart';

part 'widgets/checkbox_widget.dart';
part 'helper_classes/checkbox_form_field_controller.dart';
part 'widgets/checkbox_row_widget.dart';

class CheckBoxFormField extends FormField<List<dynamic>> {
  CheckBoxFormField(
      {super.key,
      required Map<String, dynamic> values,
      required CheckBoxFormFieldController controller,
      required String titleText,
      Axis direction = Axis.horizontal,
      TextStyle? titleTextStyle,
      String errorText = 'Please Select atleast one',
      String? Function(List<dynamic>?)? validator,
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

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                titleText,
                style: titleTextStyle,
              ),
              CheckBoxWidget(
                direction: direction,
                values: values,
                controller: controller,
                onChanged: onChangeHandler,
                fieldState: fieldState,
              ),
            ],
          );
        });
}
