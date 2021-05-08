# BLoC Bird counting app

A Flutter application for counting birds of various colors using BLoC pattern made for Mobile Application Development class.

## Abot
This application has the same functionality as the application from [rma-lv3-bird-count-app](https://github.com/kforjan/rma-lv3-bird-count-app) but it has business logic separated from the user interface. That is accomplished by using BLoC pattern instead of setState() calls inside of the presentation layer. The code is noticeably easier to read and it would be easier to implement new features or fix bugs after separating the business logic from UI.

## Task
*Refactor the bird counting application from LV3 by separating UI and business logic.*

## Setup
  1. Clone the repository using the link below:
  ```
  https://github.com/kforjan/rma-lv4-bloc-bird-count-app.git
  ```
  2. Go to the project root and execute the following commands:
  ```
  flutter pub get
  flutter run
  ```

## Preview
  ![GIF showing the functionality of the app](https://s3.gifyu.com/images/rma4-bird-bloc-preview.gif)
