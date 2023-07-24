part of '../checkbox_form_field.dart';

class CheckBoxWidget<T> extends StatelessWidget {
  const CheckBoxWidget(
      {super.key,
      required this.items,
      required this.controller,
      required this.onChanged,
      required this.fieldState,
      required this.direction});
  final List<CheckBoxFormFieldItem<T>> items;
  final CheckBoxFormFieldController<T> controller;
  final Function onChanged;
  final FormFieldState<List<T>> fieldState;
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
                  children: items
                      .map((e) => CheckboxRowWidget(
                          isSelected: selectedValues.contains(e.value),
                          hasError: fieldState.hasError,
                          onChanged: (isSelected) {
                            isSelected!
                                ? selectedValues.add(e.value)
                                : selectedValues.remove(e.value);
                            onChanged();
                          },
                          text: e.hintText))
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
