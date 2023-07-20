import 'package:flutter/material.dart';

import '../utills/constants/color_constants.dart';

class RadioRowWidget extends StatelessWidget {
  final String groupValue, text, value;
  final void Function(String? val) onChanged;
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
              value: value,
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
