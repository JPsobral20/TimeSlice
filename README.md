# TimeSlice

A Flutter-based productivity application designed to help FEUP students develop better study habits through focused work sessions, study location suggestions, a reward system, and collective contributions towards student scholarships.

## Overview

TimeSlice was developed as an academic project at the Faculty of Engineering of the University of Porto (FEUP). Its main goal is to encourage students to manage their study time more effectively while promoting a collaborative academic environment.

The application combines a focus timer with gamification elements, allowing users to turn their productive study time into rewards and contribute to collective goals.

## Features

- **Focus Timer:** Pomodoro-inspired timer with customizable study sessions and controls to start, pause, resume, and stop sessions.
- **Study Time Tracking:** Records focused study time and stores user progress.
- **Study Locations:** Provides a list of suggested places to study at FEUP.
- **Reward System:** Allows users to exchange accumulated study time for products available in the in-app shop.
- **Scholarship Contributions:** Aggregates users' study time towards a collective scholarship goal.
- **User Authentication:** Supports user accounts and personalized settings.
- **Customizable Notifications:** Configurable vibration alerts during focus sessions.

## Documentation

The project includes documentation covering its vision, requirements, architecture, and overall presentation:

- [Product Vision](Docs/Product-Vision.md)
- [Elevator Pitch](Docs/ElevatorPitch.md)
- [Requirements](Docs/Requirements.md)
- [Architecture and Design](Docs/Architecture-And-Design.md)

## Technology Stack

- **Language:** Dart
- **Framework:** Flutter
- **Backend and Database:** Firebase
  - Firebase Authentication
  - Cloud Firestore
- **Additional Packages:**
  - `percent_indicator`
  - `curved_navigation_bar`
  - `flutter_svg`
  - `vibration`
  - `flutter_gherkin`

## Project Structure

```text
TimeSlice/
├── Docs/
│   ├── Product-Vision.md
│   ├── ElevatorPitch.md
│   ├── Requirements.md
│   └── Architecture-And-Design.md
└── src/
    ├── lib/
    │   ├── Screen/
    │   ├── Widgets/
    │   ├── UserModel.dart
    │   ├── firebase_options.dart
    │   └── main.dart
    ├── APK/
    └── APK_final_release/
```

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- A Firebase project configured for the application

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/JPsobral20/TimeSlice.git
   cd TimeSlice
   ```

2. Navigate to the application directory:

   ```bash
   cd src
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Configure Firebase for your own project, including the required platform-specific configuration files.

5. Run the application:

   ```bash
   flutter run
   ```

## Android Application

Pre-built Android APKs are available in the repository:

- [APK directory](src/APK/)
- [Final APK directory](src/APK_final_release/)

For the latest version, refer to the final release directory.

## Academic Context

Developed as part of the **Software Engineering** course at the Faculty of Engineering of the University of Porto (FEUP), during the 2022/2023 academic year.

The project involved requirements engineering, software architecture, implementation, and testing.

---

**TimeSlice** - Making study time count.
