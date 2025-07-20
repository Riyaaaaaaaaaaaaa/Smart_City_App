# 🌆 Smart City App

A modern, location-aware Flutter application designed to help users explore city services, news, and places using an intuitive interface. Integrates map functionality and real-time news to create a smarter urban experience.

---

## 📱 Features

- 🗺️ **OpenStreetMap Integration**  
  View city landmarks, services, and navigation on an interactive map.

- 📰 **Live City News Feed**  
  Stay up to date with real-time news fetched via API integration.

- 📍 **Location-Based Information**  
  Detect and display your current location with useful details.

- 🎨 **Modern & Responsive UI**  
  Visually appealing design optimized for both Android and iOS.

---

## 🛠️ Tech Stack

- **Framework**: Flutter (Dart)
- **Map Integration**: `flutter_map` package with OpenStreetMap
- **News Integration**: [NewsAPI.org](https://newsapi.org) – for fetching city news (`/v2/everything?q=Gwalior`)
- **IDE**: Android Studio / VS Code

---

## 📡 NewsAPI Integration

This Flutter app uses [NewsAPI.org](https://newsapi.org) to fetch real-time news based on a city query (`q=Gwalior`).

### 🔐 API Key Setup

To securely use the News API without exposing your key:

1. **Sign up** at [https://newsapi.org](https://newsapi.org) and get your **API key**.
2. Create a file named `secrets.dart` inside your `lib/` folder.

```dart
// lib/secrets.dart
const String newsApiKey = "YOUR_API_KEY_HERE";
import 'secrets.dart';

# .gitignore
lib/secrets.dart
