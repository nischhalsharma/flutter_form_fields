import 'package:flutter/material.dart';

import '../utills/constants/color_constants.dart';

part 'widgets/checkbox_widget.dart';
part 'helper_classes/checkbox_form_field_controller.dart';
part 'widgets/checkbox_row_widget.dart';
part 'helper_classes/checkbox_form_field_item.dart';

class CheckBoxFormField<T> extends FormField<List<T>> {
  CheckBoxFormField(
      {super.key,
      required List<CheckBoxFormFieldItem<T>> items,
      required CheckBoxFormFieldController<T> controller,
      required String titleText,
      Axis direction = Axis.horizontal,
      TextStyle? titleTextStyle,
      String errorText = 'Please Select atleast one',
      String? Function(List<T>?)? validator,
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
                items: items,
                controller: controller,
                onChanged: onChangeHandler,
                fieldState: fieldState,
              ),
            ],
          );
        });
}
