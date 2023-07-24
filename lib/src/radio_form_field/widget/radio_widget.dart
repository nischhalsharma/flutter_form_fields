part of '../radio_form_field.dart';

class RadioWidget<T> extends StatelessWidget {
  final RadioFormFieldController<T> controller;
  final List<RadioFormFieldItem<T>> items;
  final Function? callback;
  final FormFieldState<dynamic>? fieldState;
  final Axis direction;

  const RadioWidget({
    required this.controller,
    super.key,
    this.callback,
    required this.items,
    this.fieldState,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, selectedValue, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              direction: direction,
              children: items
                  .map((e) => RadioRowWidget(
                        groupValue: selectedValue,
                        text: e.hintText,
                        value: e.value,
                        onChanged: (val) {
                          controller.value = val;
                          if (callback != null) callback!();
                        },
                        isError: fieldState?.hasError ?? false,
                      ))
                  .toList(),
            ),
            if (fieldState != null && fieldState!.hasError)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20.0),
                child: Text(fieldState!.errorText ?? '*',
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
