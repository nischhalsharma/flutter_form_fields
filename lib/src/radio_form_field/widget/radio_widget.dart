part of '../radio_form_field.dart';

class RadioWidget extends StatelessWidget {
  final RadioFormFieldController controller;
  final Map<String, dynamic> values;
  final Function? callback;
  final FormFieldState<String>? fieldState;
  final Axis direction;

  const RadioWidget(
    this.controller, {
    super.key,
    this.callback,
    this.values = const {"Yes": "yes", "No": "no"},
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
              children: values.keys
                  .map((key) => RadioRowWidget(
                        groupValue: selectedValue,
                        text: key,
                        value: values[key]!,
                        onChanged: (val) {
                          controller.value = val!;
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
