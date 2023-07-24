import 'package:flutter/material.dart';
import 'package:flutter_form_fields/flutter_form_fields.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(useMaterial3: true),
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Feedback Form",
              ),
            ),
            body: const FormWidget()));
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late final GlobalKey<FormState> formKey;
  late final RadioFormFieldController<bool> understoodController;
  late final RadioFormFieldController<int> ratingController;
  late final RadioFormFieldController<bool> willRecommendController;
  late final ProfileImageFormFieldController profileImageController;
  late final CheckBoxFormFieldController<Type> mostLikedWidgetsController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    understoodController = RadioFormFieldController();
    ratingController = RadioFormFieldController();
    willRecommendController = RadioFormFieldController();
    profileImageController = ProfileImageFormFieldController();
    mostLikedWidgetsController = CheckBoxFormFieldController();
    super.initState();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    understoodController.dispose();
    ratingController.dispose();
    willRecommendController.dispose();
    profileImageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          /// if both errorText and validator is null then default error text will be displayed.
          ProfileImageFormField(
            controller: profileImageController,
          ),

          /// If validator is not null the widget will display ths String returned by the validator instead of errorText or default Error Text.
          RadioFormField<bool>(
            titleText:
                "I hope you understand how to use this package by this example app. Can you please confirm?",
            controller: understoodController,
            items: [
              RadioFormFieldItem(hintText: 'Yes', value: true),
              RadioFormFieldItem(hintText: 'No', value: false)
            ],
            direction: Axis.vertical,
            validator: (val) {
              if (understoodController.value == null) {
                return "Please Select at least one option";
              }
              return null;
            },
          ),
          RadioFormField<int>(
              titleText: "How much will you rate us for this package?",
              controller: ratingController,
              validator: (val) {
                if (ratingController.value == null) {
                  return "Please Rate us";
                }
                return null;
              },
              items: [
                RadioFormFieldItem(hintText: '5 Start', value: 5),
                RadioFormFieldItem(hintText: '4 Start', value: 4),
                RadioFormFieldItem(hintText: '3 Start', value: 3),
                RadioFormFieldItem(hintText: '2 Start', value: 3),
                RadioFormFieldItem(hintText: '1 Start', value: 1),
              ]),

          /// If validator is null and errorText is not null then the Widget will display the error text given in errorText parameter.
          RadioFormField<bool>(
            titleText:
                "Will you recommend this package to your developer friends?",
            controller: willRecommendController,
            errorText: "we want to know. Please!!",
            items: [
              RadioFormFieldItem(hintText: 'Yes', value: true),
              RadioFormFieldItem(hintText: 'No', value: false)
            ],
          ),
          CheckBoxFormField<Type>(
            titleText: "Select the two widgets you liked the most?",
            items: [
              CheckBoxFormFieldItem(
                  hintText: 'ProfileImageFormField Widget',
                  value: ProfileImageFormField),
              CheckBoxFormFieldItem(
                  hintText: 'RadioFormField Widget', value: RadioFormField),
              CheckBoxFormFieldItem(
                  hintText: 'CheckBoxFormField Widget',
                  value: CheckBoxFormField),
            ],
            controller: mostLikedWidgetsController,
            validator: (values) {
              return values?.isNotEmpty ?? false
                  ? null
                  : "Please select a widget";
            },
          ),

          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Feedback Form Submitted Successfully",
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Form is not valid",
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text(
              "Submit",
            ),
          )
        ],
      ),
    );
  }
}
