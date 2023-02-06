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

# Description

Simple animations for widgets. You can just wrap any widget with it and expect it to transition on build to its position.
You can also play around with its parameters to change its duration, direction, scale factors, etc. I will be adding other simple animations in the future.

## Features

- fade animation
- scale animation
- slide animation
- faded scale animation
- faded slide animation

## Getting started

- Prerequisites: ^none

- Start with adding to the pubsec.yaml

``` dart
flutter pub get simple_animation_transition
```

## Usage

- Import

``` dart
import 'package:simple_animation_transition/simple_animation_transition.dart';
```

- Wrap any widget with any of the avaliable simple animations and see it work

``` dart
FadeAnimatedWidget(
 child: Container(
 width: size.width * 0.8,
 height: size.height * 0.1,
 decoration: BoxDecoration(
  color: Colors.black12,
   borderRadius: BorderRadius.circular(10.0),
  ),
  child: Center(
   child: Text(
    'Fade Animation',
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.headline3,
    ),
   ),
  ),
 ),
 ...
```

- You could check out example for other simple widgets

## Additional information

Contributions to the package are welcome and appriciated.
