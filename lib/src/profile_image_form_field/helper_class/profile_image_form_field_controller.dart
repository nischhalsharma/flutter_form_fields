part of '../profile_image_form_field.dart';

class ProfileImageFormFieldController extends ValueNotifier<File?> {
  ProfileImageFormFieldController() : super(null);
  File? get imageFile => super.value;
  void clear() {
    super.value = null;
    notifyListeners();
  }
}
