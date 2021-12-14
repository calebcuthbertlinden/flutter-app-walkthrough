# flutter_app_walkthrough

A basic Flutter project to be used for a walkthrough

## Getting Started

--------------------------------------------------------
Setup
--------------------------------------------------------
- Install Flutter SDK: https://docs.flutter.dev/get-started/install
- Dart SDK comes with the Flutter SDK
- Android Studio / XCode / VS Code / Any text editor

--------------------------------------------------------
Android Studio
--------------------------------------------------------
- Install Flutter plugin from marketplace

--------------------------------------------------------
Project structure
--------------------------------------------------------
- android - native android project, build gradle, etc
- ios - native iOS project,
- lib - dart and flutter code
- test - test files
- pubspec.yaml

--------------------------------------------------------
lib
--------------------------------------------------------
- Where your dart files live
- main.dart

--------------------------------------------------------
pubspec.yaml
--------------------------------------------------------
- dependency management
- app version
	- buildName: 1.0.0
	- buildNumber: 1
- Flutter sdk version
- dependencies
- pub dev
	- https://pub.dev/

--------------------------------------------------------
Flutter build commands
--------------------------------------------------------
- flutter doctor - clean
- flutter pub get - fetch dependencies
- flutter pub upgrade - update dependencies to latest version

--------------------------------------------------------
Widgets
--------------------------------------------------------
- Stateful
	- Has state object

	- setState(() {})
		- build method is run every time setState is called
		- like render in Reactjs

	- initState
		- initialises state prior to building the widget


- Stateless
	- No state
	- All fields are final
	- Just used to render a view


- Layout widgets
	- Have one child
		- Center - positions child in center of parent
		- SizedBox - Specify the size of the widget
		- Padding - Can wrap any widget in Padding
		-
	- Have children
		- Column - Vertical and takes a list of any type of widget
		- Row - Same but horizontal
		- Stack - Almost like a relative layout, place things on top of each other
		-

- mainAxisAlignment
	- Columns are VERTICAL so main axis will be VERTICAL
	- Rows are HORIZONTAL so main axis is HORIZONTAL
- crossAxisAligment

--------------------------------------------------------
Routing
--------------------------------------------------------

- Your App widget takes a routes field
- Define the routes/widgets/screens for your app
- Navigator.push()
- Navigator.pop()


--------------------------------------------------------
Http requests
--------------------------------------------------------

- http - https://pub.dev/packages/http
- Dio - https://pub.dev/packages/dio

- http.get(path, {"Authorisation":"Basic nduewief="})
- http.post(path, {"field1":"value1:}, {"Authorisation":"Basic nduewief="})

--------------------------------------------------------
Tests
--------------------------------------------------------


--------------------------------------------------------
Code style
--------------------------------------------------------
- lower camel case for const names (ResColors)

--------------------------------------------------------
Assets
--------------------------------------------------------
- image assets
-