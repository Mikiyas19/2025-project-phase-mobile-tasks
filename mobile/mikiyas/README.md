# Ecommerce Mobile App

A Flutter ecommerce app with complete CRUD operations and navigation features.

## 🚀 Task 7: Navigation & Routing Implementation

This project implements complete navigation, routing, and data passing features for an e-commerce Flutter application.

### ✅ Task Requirements Completed

- **Screen Navigation** - All three screens with proper navigation
- **Named Routes** - Route table defined and utilized throughout app
- **Data Passing** - Product data passed between all screens
- **Navigation Animations** - Custom slide transitions between screens
- **Navigation Events** - Back button and navigation stack properly handled

### 📱 App Features

- **Home Screen** - Product listing with responsive grid layout
- **Product Details** - View product details with update/delete options
- **Add/Edit Products** - Create new products or edit existing ones
- **Smooth Animations** - Custom slide transitions between screens
- **Data Persistence** - Proper data passing between all screens

### 🎯 Navigation Flow

- **Home → Details**: Tap any product card (with product data)
- **Home → Add**: Tap floating action button
- **Details → Edit**: Tap UPDATE button (with existing product data)
- **Back Navigation**: Properly handled with animations

### 🛠️ Technical Implementation

- **Named Routes** defined in `main.dart`
- **Custom Animations** with `PageRouteBuilder`
- **Data Passing** using constructor parameters and return values
- **Form Validation** with proper error handling
- **State Management** with setState for UI updates

### 🚀 Getting Started

```bash
# Clone the repository
git clone https://github.com/Mikiyas19/2025-project-phase-mobile-tasks.git

# Navigate to project
cd mobile/mikiyas/

# Install dependencies
flutter pub get

# Run the app
flutter run