part of '../radio_form_field.dart';

class RadioWidget extends StatelessWidget {
  final ValueNotifier<String> radioValue;
  final List<String> values, titles;
  final Function? callback;
  final FormFieldState<String>? fieldState;

  const RadioWidget(
    this.radioValue, {
    super.key,
    this.callback,
    this.values = const ["yes", "no"],
    this.titles = const ["Yes", "No"],
    this.fieldState,
  });

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: radioValue,
        builder: (context, value, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: values
                  .asMap()
                  .map(
                    (index, value) => MapEntry(
                      index,
                      RadioRowWidget(
                        groupValue: radioValue.value,
                        text: titles[index],
                        value: value,
                        onChanged: (val) {
                          radioValue.value = val!;
                          if (callback != null) callback!();
                        },
                        isError: fieldState?.hasError ?? false,
                      ),
                    ),
                  )
                  .values
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
