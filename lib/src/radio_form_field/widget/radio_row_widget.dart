part of '../radio_form_field.dart';

class RadioRowWidget extends StatelessWidget {
  final dynamic groupValue, value;
  final String text;
  final void Function(dynamic val) onChanged;
  final bool isError;

  const RadioRowWidget(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.text,
      required this.onChanged,
      this.isError = false});

  @override
  InkWell build(BuildContext context) => InkWell(
        onTap: () => onChanged(value),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<String>(
              fillColor: isError
                  ? MaterialStateColor.resolveWith(
                      (states) => ColorConstants.errorTextColor)
                  : null,
              value: value.toString(),
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Text(
              text,
            ),
          ],
        ),
      );
}
