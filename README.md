# Task Management System

Task manager app using Flutter that allows users to manage their tasks efficiently.


![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

A robust and intuitive Task Management System built with Flutter. This system allows users to create, edit, delete, and view tasks, as well as login to manage their task list. The project follows clean architecture principles and includes comprehensive tests.

## Table of Contents
- [Features](#features)
- [Screenshots](#screenshots)
- [Installation](#installation)
- [Usage](#usage)
- [Testing](#testing)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)

## Features
- **User Authentication**: Login functionality to manage tasks securely.
- **Task Management**: Create, edit, delete, and view tasks.
- **Clean Architecture**: Well-organized code following clean architecture principles.
- **Comprehensive Testing**: Includes unit and integration tests for all functionalities.

## Screenshots
<p align="center">
  <img src="screenshots/splash.png" alt="Login Screen" width="200">
  <img src="screenshots/login1.png" alt="Login Screen" width="200">
  <img src="screenshots/login2.png" alt="Login Screen" width="200">
  <img src="screenshots/all_tasks.png" alt="Task List Screen" width="200">
  <img src="screenshots/my_tasks.png" alt="Task Details Screen" width="200">
  <img src="screenshots/profile.png" alt="Task Details Screen" width="200">
</p>



## Install dependencies:

sh
Copy code
flutter pub get
Run the app:

sh
Copy code
flutter run


## Usage
After installing the app, you can use it as follows:

Login: Use the login screen to authenticate.
Manage Tasks: Create new tasks, view existing tasks, edit details of tasks, and delete tasks.
View Task Details: Click on a task to see its details.


## Testing

To run the tests for this project:

Navigate to the test folder:

sh
Copy code
cd test
Run the tests:

sh
Copy code
flutter test

## Folder Structure
Here's an overview of the project's folder structure:

kotlin
Copy code
task-management-system/
├── lib/
│   ├── core/
│   ├── data/
│   ├── domain/
│   ├── presentation/
│   └── main.dart
├── test/
│   ├── core/
│   ├── data/
│   ├── domain/
│   ├── presentation/
├── screenshots/
│   ├── login.png
│   ├── task_list.png
│   ├── task_details.png
├── README.md
├── pubspec.yaml

## lib: Contains the main application code.
## test: Contains the test cases.
## screenshots: Contains images used in the README.
## README.md: The README file in the root directory.
## pubspec.yaml: Flutter project dependencies and configuration.

 ## Contributing
Contributions are welcome! Please fork the repository and create a pull request with your changes. Ensure your code follows the project's coding standards and includes tests for new functionalities.

## License
This project is licensed under the MIT License. See the LICENSE file for more information.
