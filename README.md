# Pet Adoption App

The Pet Adoption App is a mobile application that allows users to browse and adopt pets from various shelters and rescue organizations. This app provides a convenient platform for users to find their perfect furry companions and facilitates the adoption process. It offers a user-friendly interface and a range of features to enhance the adoption experience.

## Features

1. **Home Page**: The home page displays a collection of available pets with essential information such as name, age, price, and breed. Users can easily browse through the list of pets and find their desired companion.

2. **Detail Page**: The detail page provides comprehensive information about each pet, including their image, name, age, price, breed, and type. Users can view detailed profiles and make informed decisions about adoption.

3. **Interactive Image Viewer**: By clicking on a pet's image, users can access an interactive viewer that allows zooming in and out. This feature provides a closer look at the pet's image, enabling users to examine details and connect emotionally with the pets. *(Extra score)*

4. **Adopt Me Button**: On the detail page, an "Adopt Me" button is available. Clicking this button displays a popup message that confirms the adoption and shows the name of the adopted pet.

5. **History Page**: The app includes a history page that lists all the adopted pets in chronological order. Users can view their adoption history and revisit the profiles of previously adopted pets.

6. **Dark Mode Support**: The app offers support for dark mode, providing users with the option to switch between light and dark themes for optimal viewing comfort.

7. **Floating Action Button**: A floating action button located at the bottom right corner of the app allows users to access the dark mode and history page conveniently.

### Tests

I have implemented three tests for the Pet class:
1. **Unit Test**: A unit test to ensure the Pet object is correctly created from JSON data.
2. **Unit Test**: Another unit test to verify that the Pet object can be serialized to JSON properly.
3. **Widget Test**: A widget test to validate the functionality and UI of the pet adoption feature.

These tests ensure the reliability and accuracy of the app's core functionalities.

## Getting Started

To use the Pet Adoption App, follow these steps:

1. Clone the repository: `git clone https://github.com/your-repo-url.git`
2. Install the necessary dependencies: `flutter pub get`
3. Run the app on an emulator or physical device: `flutter run`

Make sure you have Flutter and Dart installed on your machine.

### Requirements

The Pet Adoption App requires Flutter version 2.0 or above. Ensure that your development environment meets the following requirements:

- Flutter SDK
- Dart SDK
- Emulator or physical device for testing

### Dependencies

The app utilizes the following dependencies:

- `motion_toast: ^2.6.8`
- `slider_button: ^2.0.0`
- `photo_view: ^0.14.0`
- `shared_preferences: ^2.1.2`
- `provider: ^6.0.5`
- `hawk_fab_menu: ^1.2.0`
- `flutter_launcher_icons: ^0.13.1`
- `flutter_native_splash: ^2.3.1`

You can find the complete list of dependencies in the `pubspec.yaml` file.

### Contributing

Contributions to the Pet Adoption App are welcome! If you find any bugs, have feature requests, or want to contribute to the project, feel free to open an issue or submit a pull request.

When contributing, please adhere to the existing code style, follow best practices, and ensure that your changes are well-tested.

