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

This package provides devlopers a variety of Custom Widgets that can be used with Form. 

## Features

The package contains some Widgets that can be used in the Form. They have validation function which can help developer to display error Text if input is not satisfied by the function. By Default Flutter sdk doesn't povide validation Feature on some input fields.

## Getting started

Add flutter_form_fields under dependencies in pubspec.yaml file.
 
## example

![](example-gif.gif)

## Usage

```dart
ValueNotifier<String> radioValue = ValueNotifier('');
ValueNotifier<File?> imageFile = ValueNotifier(null);
RadioFormField(
            radioValue: radioValue,
            validator: (val) {
              if (radioValue.value == '') {
                return "Please Select at least one option";
              }
              return null;
            },
          ),

ProfileImageFormField(
            imageFile: profileImage,
            validator:(imageFile){
               /// Validation Condition
            }
          ),
```

## Additional information

See example section to see more about using this package.
