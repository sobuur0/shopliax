# Shopliax

Shopliax is a comprehensive todo application with additional features, built using Flutter. It allows users to manage their tasks efficiently and view a list of items fetched from an external API.

## Features

- Add and manage todo items
- View todo list on a dedicated screen
- Display overdue todos on the home screen
- Swipe to delete todo items
- Show today's todos and todo summaries on the home screen
- Fetch and display a list of items from an external API
- Offline storage capability

## Technology Stack

- Flutter 3.22.2
- Dart SDK: '>=3.4.3 <4.0.0'
- State Management: MobX
- Dependency Injection: Provider
- Offline Storage: shared_preferences
- API Integration: http package

## Project Structure

The project follows an MVVM-like architecture with Provider for dependency injection. The main components are:

- Models: Represent the data structures
- Views: UI components and screens
- Stores: MobX stores for state management

## Setup and Running

1. Ensure you have Flutter 3.22.2 or later installed on your machine.
2. Clone the repository:
3. Navigate to the project directory:
```
cd shopliax

```
4. Install dependencies:
```
flutter pub get

```
5. Run the app:
```
flutter run

```


## Offline Storage

The app utilizes shared_preferences for offline storage, allowing users to access their todos even without an internet connection. The implementation includes:

- Saving todos locally when created or updated
- Loading todos from local storage when the app starts
- Fallback to local data when network requests fail

## State Management

MobX is used for state management, providing a reactive and efficient way to handle the app's state. The main stores include:

- TodoStore: Manages the state of todos, including CRUD operations and filtering
- PhotoStore: Handles the fetching and storage of photos from the API

## Extra Features

- Overdue Todos: The app includes a feature to display overdue todos, helping users prioritize their tasks effectively.