import 'package:flutter/material.dart';
import 'package:flutter_form_fields/flutter_form_fields.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<String> likedThisApp = ValueNotifier('');
  final ValueNotifier<String> rating = ValueNotifier('');
  final ValueNotifier<String> willRecommend = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Feedback Form",
            ),
          ),
          body: FormWidget(
              formKey: formKey,
              likedThisApp: likedThisApp,
              rating: rating,
              willRecommend: willRecommend)),
    );
  }
}

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.formKey,
    required this.likedThisApp,
    required this.rating,
    required this.willRecommend,
  });

  final GlobalKey<FormState> formKey;
  final ValueNotifier<String> likedThisApp;
  final ValueNotifier<String> rating;
  final ValueNotifier<String> willRecommend;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "I hope you understand how to use this package by this example app. Can you please confirm?",
          ),
          RadioFormField(
            radioValue: likedThisApp,
            validator: (val) {
              if (likedThisApp.value == '') {
                return "Please Select at least one option";
              }
              return null;
            },
          ),
          const Text(
            "How much will you rate us for this package?",
          ),
          RadioFormField(
            radioValue: rating,
            validator: (val) {
              if (rating.value == '') {
                return "Please Rate us";
              }
              return null;
            },
            titles: const [
              "5 Star",
              "4 Star",
              "3 Star",
              "2 Star",
              "1 Star",
            ],
            values: const [
              "5",
              "4",
              "3",
              "2",
              "1",
            ],
            autovalidateMode: AutovalidateMode.disabled,
          ),
          const Text(
            "Will you recommend this package to your developer friends?",
          ),
          RadioFormField(
            radioValue: willRecommend,
            errorText: "we want to know. Please!!",
            titles: const ["Yes", "No", "Not at all"],
            values: const ["yes", "no", "not at all"],
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
