# Genesia App

Genesia is an interactive mobile app that allows users to select and chat with AI characters. The app provides an engaging onboarding experience, character selection, and a chat interface with persistent storage for chat history.

## Features

- **Onboarding Process:** A streamlined onboarding process to get users familiar with the app.
- **Character Selection:** Choose from a variety of AI characters to chat with.
- **Chat Interface:** Interactive chat interface with persistent chat history.
- **Settings:** Configure app preferences such as enabling/disabling notifications.
- **Responsive Design:** The app is designed to work on various screen sizes and orientations.

## Getting Started

Follow these instructions to set up and run the project on your local machine.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 2.5.0 or higher)
- [Dart SDK](https://dart.dev/get-dart) (version 2.14.0 or higher)
- An IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-username/genesia_app.git
   cd genesia_app

lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   ├── utils/
│   │   └── app_utils.dart
│   └── widgets/
│       ├── custom_button.dart
│       └── chat_bubble.dart
├── data/
│   └── models/
│       └── character_model.dart
├── ui/
│   ├── character_selection/
│   │   └── character_selection_screen.dart
│   ├── chat/
│   │   └── chat_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   └── onboarding/
│       ├── onboarding_page.dart
│       └── onboarding_screen.dart
└── main.dart
