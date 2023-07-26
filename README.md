<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This package provides developers a variety of Custom Widgets that can be used with Form. 

## Features

The package contains some Widgets that can be used in the Form. They have validation function which can help developer to display error Text if input is not satisfied by the function. By Default Flutter sdk doesn't povide validation Feature on some input fields.

## Getting started

Add flutter_form_fields under dependencies in pubspec.yaml file.
 
## example

![](example-gif.gif)

## Usage

```dart
final ProfileImageFormFieldController profileImageController = ProfileImageFormFieldController();
final RadioFormFieldController ratingController<int> = RadioFormFieldController();
final CheckBoxFormFieldController mostLikedWidgetsController<Type> = CheckBoxFormFieldController();

ProfileImageFormField(
            controller: profileImageController,
            validator:(imageFile){
               /// Validation Condition
            }
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
```

## Additional information

See example section to see more about using this package.
