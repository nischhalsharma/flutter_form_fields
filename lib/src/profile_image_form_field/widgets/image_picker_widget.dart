
part of '../profile_image_form_field.dart';
class ImagePickerWidget extends StatefulWidget {
  final ValueNotifier<File?> imageFile;
  final Color borderColor;
  final FormFieldState<File>? fieldState;
  final void Function()? onChanged;
  const ImagePickerWidget({
    super.key,
    required this.imageFile,
    required this.borderColor,
    required this.fieldState,
    this.onChanged,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  Future pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      widget.imageFile.value = File(pickedFile.path);
      if (widget.onChanged != null) widget.onChanged!();
    }
  }

  @override
  Align build(BuildContext context) => Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: pickImage,
              borderRadius: BorderRadius.circular(80),
              splashColor: widget.borderColor,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: widget.borderColor.withOpacity(0.1),
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: widget.borderColor.withOpacity(0.5),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: widget.borderColor,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          child: ValueListenableBuilder(
                            valueListenable: widget.imageFile,
                            builder: (context, value, child) => value != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(68),
                                    child: Image.file(
                                      widget.imageFile.value!,
                                      fit: BoxFit.cover,
                                      width: 105,
                                      height: 105,
                                    ),
                                  )
                                : Icon(
                                    Icons.person_2_outlined,
                                    size: 36,
                                    color: widget.borderColor,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    end: 0,
                    top: 80,
                    child: InkWell(
                      radius: 20,
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        widget.imageFile.value = null;
                        if (widget.onChanged != null) widget.onChanged!();
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.delete,
                            color: widget.borderColor,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (widget.fieldState != null && widget.fieldState!.hasError)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20.0),
                child: Text(widget.fieldState!.errorText ?? '*',
                    style: TextStyle(
                        fontFamily: "OpenSans-Regular",
                        color: ColorConstants.errorTextColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w300)),
              ),
          ],
        ),
      );
}
