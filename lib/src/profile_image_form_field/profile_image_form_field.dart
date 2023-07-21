import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utills/constants/color_constants.dart';

part 'widgets/image_picker_widget.dart';

/// [ProfileImageFormField] widget can be used in a form to pick image as a profile image from the user's gallery.
class ProfileImageFormField extends FormField<File> {
  ProfileImageFormField({
    super.key,
    super.onSaved,
    super.enabled = true,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,

    /// Gives color to the border of the widget. Default set to [Colors.blue]
    Color borderColor = Colors.blue,

    /// The callback function will we called when the imput changes
    Function? callback,

    /// When the input is invalid the [errorText] will be shown, if don,t have any value then default error text will be shown.
    String errorText = "Please pick a image",

    /// Validator function determines if the input in the field is valid or not. return null if valid else return a string that can be display to  the user.
    String? Function(File? val)? validator,
    required ValueNotifier<File?> imageFile,
  }) : super(validator: (val) {
          if (validator != null) return validator(val);
          if (val == null) {
            return errorText;
          }
          return null;
        }, builder: (FormFieldState<File> fieldState) {
          void onChangehandler() {
            fieldState.didChange(imageFile.value);
            if (callback != null) callback();
          }

          return ImagePickerWidget(
            imageFile: imageFile,
            borderColor: borderColor,
            fieldState: fieldState,
            onChanged: onChangehandler,
          );
        });
}
