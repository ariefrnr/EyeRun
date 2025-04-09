# 🏃‍♂️ EyeRun – Personalized Jogging Companion for iOS

**EyeRun** is a powerful yet lightweight iOS running companion designed to elevate your jogging experience through smart, personalized fitness tracking. Built with **Swift**, integrated natively with **HealthKit**, **CoreLocation**, and **CoreMotion**, EyeRun delivers real-time insights including step count, distance, calories burned, elapsed time, and cadence — all presented within a clean and intuitive **SwiftUI** interface.

---

## 📱 App Overview

EyeRun empowers users to run smarter and more consistently by combining health data, motion tracking, and location awareness. Whether you're a beginner or a fitness enthusiast, EyeRun offers personalized feedback, motivational tools, and performance optimizers without overwhelming complexity.

### 🔍 Features at a Glance

- 📍 **Accurate Step, Distance, & Calorie Tracking**
- 🕒 **Real-Time Run Metrics with SwiftUI**
- 🎧 **Motivational Feedback to Keep You Moving**
- 🏃 **Cadence Monitoring (Steps per Minute)**
- ⏱️ **Interval Timer for Structured Training**
- ⚡ **Speed Pacer to Maintain Consistent Tempo**
- 📊 **Seamless Apple HealthKit Integration**

---

## 🎯 Problem & Opportunity

The growing global focus on fitness and quantified self has created demand for intuitive, integrated health apps. Many fitness apps today are either data-heavy or lack personalization for runners.

EyeRun fills this gap by offering:

- ✅ Native integration with Apple frameworks for accurate and energy-efficient tracking.
- ✅ Tailored features for runners like pace guidance and interval timers.
- ✅ Simple, clean UI/UX suited for casual to intermediate runners.
- ✅ Real-time motivational support to build running habits.

---

## 🔧 Tech Stack

| Technology     | Description                                |
|----------------|--------------------------------------------|
| Swift          | Native iOS development                     |
| SwiftUI        | Declarative UI framework                   |
| HealthKit      | Health and fitness data management         |
| CoreMotion     | Motion tracking and cadence analysis       |
| CoreLocation   | GPS-based distance and location tracking   |

---

## 📸 App Screenshots

| Home Screen               | Live Metrics              | Apple Watch View         |
|---------------------------|---------------------------|---------------------------|
| ![Home](assets/app_home.jpg) | ![Metrics](assets/live_metrics.jpg) | ![Watch](assets/watch_view.jpg) |

> Screenshots are available in the `assets/` directory.

---

## 🧭 Project Structure

```bash
EyeRun/
├── EyeRun.xcodeproj/           # Xcode project configuration
├── EyeRun/                     # App source code
│   ├── Views/                  # SwiftUI views
│   ├── ViewModels/             # Logic and data binding
│   ├── Models/                 # Data structures
│   └── Services/               # HealthKit, Motion, Location managers
├── assets/                     # App screenshots for documentation
└── README.md                   # Project documentation
```

## 🧪 Getting Started

**Prerequisites**
- macOS with Xcode 15 or higher
- iPhone device or iOS Simulator (iOS 17+ recommended)
- Enable Health, Motion & Location permissions on first launch

**Installation**
1. Clone the repository:
```bash
git clone https://github.com/ariefrnr/EyeRun.git
cd EyeRun
```
3. Open in Xcode:
```bash
open EyeRun.xcodeproj
```
5. Run the app on a physical device or simulator.

## 🧠 Design Resources  
• 🎨 [Figma Design](https://www.figma.com/design/0pGzLS5zeJNBH2qyCEMnwf/CC1?node-id=13-34&t=Kycm6mys7jtfybcE-1)  
• 🧭 [Miro Journey Map](https://miro.com/app/board/uXjVIXaHxLo=/?share_link_id=301250632045)

## 📄 License
This project is currently closed-source and proprietary. For access or licensing inquiries, please contact the development team.

## 📬 Contact & Contributions
We’re open to collaboration, feedback, and feature suggestions.
Please submit issues or pull requests on GitHub, or reach out to the team directly.
