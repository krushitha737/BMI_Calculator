# 💜 BMI Calculator – Flutter

A modern and interactive **BMI (Body Mass Index) Calculator** built using Flutter and Dart. This application allows users to calculate their BMI based on height and weight, view their BMI category, and understand their results through a clean and user-friendly interface.

## 📌 Project Overview

The BMI Calculator is a Flutter-based application designed to help users calculate their Body Mass Index easily. Users can enter their gender, height, weight, and age to calculate their BMI and view a personalized result screen.

The application features a premium Lavender and White theme, animated BMI visualization, and clear BMI category indicators.

## ✨ Features

- **Gender Selection:** Choose between Male and Female.
- **Height Adjustment:** Adjust height using an interactive slider.
- **Weight Selection:** Increase or decrease weight using counter controls.
- **Age Selection:** Select age using interactive controls.
- **BMI Calculation:** Automatically calculates BMI using height and weight.
- **BMI Classification:** Displays Underweight, Normal Weight, Overweight, or Obesity.
- **Animated BMI Indicator:** Displays the calculated BMI with an animated circular indicator.
- **Result Dashboard:** Shows BMI score, category, interpretation, gender, and age.
- **Recalculate Option:** Easily return to the home screen and calculate again.
- **Responsive Interface:** Designed to work in the browser.

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Flutter | UI development |
| Dart | Programming language |
| Visual Studio Code | Development environment |
| Git | Version control |
| GitHub | Source code hosting |

## 🧮 BMI Calculation

The application calculates BMI using the following formula:

**BMI = Weight (kg) / Height (m)²**

For example:

- Weight = 65 kg
- Height = 170 cm = 1.70 m

BMI = 65 / (1.70 × 1.70)

**BMI = 22.5**

### BMI Categories

| BMI Range | Category |
|---|---|
| Below 18.5 | Underweight |
| 18.5 – 24.9 | Normal Weight |
| 25.0 – 29.9 | Overweight |
| 30.0 and above | Obesity |

*Note: These are standard adult BMI reference categories. BMI is a screening measure and not a medical diagnosis.*

## 📸 Screenshots

### Home Screen

![BMI Calculator Home Screen](screenshots/home.png)

### BMI Result Screen

![BMI Calculator Result Screen](screenshots/result.png)

## 📂 Project Structure

```text
bmi_calculator/
│
├── lib/
│   ├── main.dart
│   └── result_screen.dart
│
├── test/
│   └── widget_test.dart
│
├── android/
├── ios/
├── web/
├── windows/
├── linux/
├── macos/
│
├── pubspec.yaml
├── pubspec.lock
├── README.md
└── .gitignore
```

## 🚀 Installation and Execution

### Prerequisites

- Flutter SDK
- Dart SDK
- Visual Studio Code
- Flutter and Dart VS Code extensions

### Steps to Run

**1. Clone the repository**

```bash
git clone https://github.com/krushitha737/BMI-Calculator-Flutter.git
```

**2. Navigate to the project directory**

```bash
cd BMI-Calculator-Flutter
```

**3. Install dependencies**

```bash
flutter pub get
```

**4. Run the application in Chrome**

```bash
flutter run -d chrome
```

## 🧪 Testing

The application was checked using Flutter's static analysis and widget testing tools.

```bash
flutter analyze
flutter test
```

## 🎯 Future Enhancements

- Store previous BMI calculations.
- Add BMI history and progress tracking.
- Include additional health insights.
- Add dark mode support.
- Improve accessibility and user customization.

## 👩‍💻 Developer

**Krushitha**

B.Tech – Computer Science and Engineering

## 🔗 GitHub Repository

[ BMI Calculator – Flutter ](https://github.com/krushitha737/BMI-Calculator-Flutter)

---

⭐ If you find this project useful, consider giving it a star!