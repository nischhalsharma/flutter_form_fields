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
  late final RadioFormFieldController understoodController;
  late final RadioFormFieldController ratingController;
  late final RadioFormFieldController willRecommendController;
  late final ProfileImageFormFieldController profileImageController;
  late final CheckBoxFormFieldController mostLikedWidgetsController;

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
          RadioFormField(
            titleText:
                "I hope you understand how to use this package by this example app. Can you please confirm?",
            controller: understoodController,
            direction: Axis.vertical,
            validator: (val) {
              if (understoodController.value == null) {
                return "Please Select at least one option";
              }
              return null;
            },
          ),
          RadioFormField(
            titleText: "How much will you rate us for this package?",
            controller: ratingController,
            validator: (val) {
              if (ratingController.value == null) {
                return "Please Rate us";
              }
              return null;
            },
            values: const {
              "5 Star": 5,
              "4 Star": 4,
              "3 Star": 3,
              "2 Star": 2,
              "1 Star": 1,
            },
          ),

          /// If validator is null and errorText is not null then the Widget will display the error text given in errorText parameter.
          RadioFormField(
            titleText:
                "Will you recommend this package to your developer friends?",
            controller: willRecommendController,
            errorText: "we want to know. Please!!",
            values: const {
              "Yes": "yes",
              "No": "no",
              "Not at all": "Not at all"
            },
          ),
          CheckBoxFormField(
            titleText: "Select the two widgets you liked the most?",
            values: const {
              "ProfileImageFormField Widget": ProfileImageFormField,
              "RadioFormField Widget": RadioFormField,
              "CheckBoxFormField Widget": CheckBoxFormField
            },
            controller: mostLikedWidgetsController,
            validator: (values) {
              return values?.length == 2 ? null : "Please select two values";
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
