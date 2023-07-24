part of '../checkbox_form_field.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {super.key,
      required this.values,
      required this.controller,
      required this.onChanged,
      required this.fieldState,
      required this.direction});
  final Map<String, dynamic> values;
  final CheckBoxFormFieldController controller;
  final Function onChanged;
  final FormFieldState<List<dynamic>> fieldState;
  final Axis direction;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, selectedValues, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                  direction: direction,
                  children: values.keys
                      .map((key) => CheckboxRowWidget(
                          isSelected: selectedValues.contains(values[key]),
                          hasError: fieldState.hasError,
                          onChanged: (isSelected) {
                            isSelected!
                                ? selectedValues.add(values[key]!)
                                : selectedValues.remove(values[key]!);
                            onChanged();
                          },
                          text: key))
                      .toList()),
              if (fieldState.hasError)
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20.0),
                  child: Text(fieldState.errorText ?? '*',
                      style: TextStyle(
                          fontFamily: "OpenSans-Regular",
                          color: ColorConstants.errorTextColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w300)),
                ),
            ],
          );
        });
  }
}
