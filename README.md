# auditapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## GetX

GetX has a highly active and helpful community. If you have questions, or 
would like any assistance regarding the use of this framework, please join our 
community channels, your question will be answered more quickly, and it will be 
the most suitable place. This repository is exclusive for opening issues, and 
requesting resources, but feel free to be part of GetX Community.

## How I can run it?

## Installation

- flutter version > 2.0 ,support null safety
- clone this repository

Run below code in terminal

```sh
flutter pub get
flutter run
```

## Packages

- [get](https://pub.dev/packages/get) ^4.6.5
- [http](https://pub.dev/packages/http) ^1.1.1
- [sqflite](https://pub.dev/packages/sqflite) ^2.0.3
- [Path Provider](https://pub.dev/packages/path_provider) ^2.0.11
- [Connectivity_plus](https://pub.dev/packages/connectivity_plus) ^4.0.1
- [intl](https://pub.dev/packages/intl) ^0.17.1


## Project structure

I use controller for both screen.

````
lib
 ┣ model
 ┃ ┣ audit_model.dart
 ┃ ┗ filter_models.dart
 ┣ service
 ┃ ┣ error_config.dart
 ┃ ┗ service_base.dart
 ┣ ui
 ┃ ┣ controller
 ┃ ┃ ┗ home_controller.dart
 ┃ ┣ view
 ┃ ┃ ┣ filter_screen.dart
 ┃ ┃ ┗ home_screen.dart
 ┃ ┗ widget
 ┃ ┃ ┣ card_widget.dart
 ┃ ┃ ┣ chip_button.dart
 ┃ ┃ ┣ date_widget.dart
 ┃ ┃ ┣ multidropdown_widget.dart
 ┃ ┃ ┣ primary_button.dart
 ┃ ┃ ┣ text_time_widget.dart
 ┃ ┃ ┗ text_value_widget.dart
 ┣ utils
 ┃ ┣ custom_snackbar.dart
 ┃ ┗ database_helper.dart
 ┗ main.dart