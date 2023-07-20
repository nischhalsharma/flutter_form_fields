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
          body: Form(
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
                    formKey.currentState?.validate();
                  },
                  child: const Text(
                    "Submit",
                  ),
                )
              ],
            ),
          )),
    );
  }
}
