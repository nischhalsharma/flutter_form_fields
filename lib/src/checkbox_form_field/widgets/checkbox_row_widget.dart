part of '../checkbox_form_field.dart';

class CheckboxRowWidget extends StatelessWidget {
  const CheckboxRowWidget(
      {super.key,
      required this.onChanged,
      required this.text,
      required this.isSelected,
      required this.hasError});
  final void Function(bool?) onChanged;
  final String text;
  final bool isSelected, hasError;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          isError: hasError,
          value: isSelected,
          onChanged: (value) {
            onChanged(value);
          },
        ),
        GestureDetector(
            onTap: () {
              onChanged(!isSelected);
            },
            child: Text(text))
      ],
    );
  }
}
