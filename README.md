# Zembo Agent App

A Flutter-based mobile application for Zembo energy agents to manage battery swapping operations, shift tracking, and delivery requests across multiple countries.

## 🏗️ Architecture

### Clean Architecture Pattern
The application follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── domain/           # Business entities and models
├── application/      # Business logic (BLoC/Cubit)
├── infrastructure/   # Data sources and external services
├── presentation/     # UI layer (pages, widgets, routing)
└── core/            # Shared utilities and constants
```

### State Management
- **BLoC Pattern** with Cubit for state management
- **Freezed** for immutable state classes and data models
- **Injectable/GetIt** for dependency injection

### Key Components

#### Domain Layer
- **Entities**: `User`, `Country`, `Station`, `Shift`, `BatteryRequest`, `ShiftHistory`
- **Value Objects**: Location, notifications
- **Business Rules**: Role-based access, geofencing validation

#### Application Layer
- **Cubits**: `AuthCubit`, `ShiftCubit`, `BatteryRequestCubit`, `ConnectivityCubit`
- **Interfaces**: `IAuthFacade`, `IShiftFacade`, `IBatteryRequestFacade`, `ILocalDBFacade`
- **State Classes**: Immutable state with status tracking

#### Infrastructure Layer
- **Local Storage**: Hive for offline data persistence
- **HTTP Client**: Dio with interceptors for API communication
- **Authentication**: Secure token storage with flutter_secure_storage
- **Notifications**: Firebase Cloud Messaging integration

#### Presentation Layer
- **Go Router**: Declarative routing with nested navigation
- **Role-based UI**: Dynamic interfaces for swappers vs riders
- **Responsive Design**: Scalable UI components with UiUtil

## 🔄 Offline-First Strategy

### Local Data Persistence
The app implements a robust offline-first approach using **Hive** for local storage:

```dart
// Hive BoxCollection for organized data storage
BoxCollection.open('ZemboDB', {
  'shift_history',
  'user', 
  'battery_request'
});
```

### Sync Mechanisms

#### 1. Automatic Sync on Connectivity
```dart
// Monitors connectivity and syncs when online
ConnectivityCubit().onConnectionChange.listen((connected) {
  if (connected) {
    syncLocalToRemoteShiftHistory();
    syncLocalToRemoteBatteryRequest();
  }
});
```

#### 2. Optimistic Updates
- User actions are immediately stored locally
- Background sync occurs when connectivity is restored
- Conflict resolution with server timestamps

#### 3. Data Synchronization Flow
1. **Create locally** with `synced: false` flag
2. **Queue for upload** when offline
3. **Batch sync** when connectivity restored
4. **Merge remote updates** to local storage

### Offline Features
- ✅ **Shift Management**: Start/end shifts offline
- ✅ **Battery Requests**: Create requests offline
- ✅ **User Authentication**: Cached user sessions
- ✅ **Geolocation**: Cached location data
- ✅ **Photos**: Local storage with cloud upload queue

## 🌍 Multi-Country Approach

### Internationalization (i18n)
```dart
// Localization support
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^0.20.2

// ARB files for multiple languages
l10n/arb/
├── app_en.arb  # English
├── app_es.arb  # Spanish
```

### Timezone Management
- **Country-specific timezones**: Africa/Nairobi, UTC offsets
- **PostgreSQL timestamptz**: Server-side timezone handling
- **Local time conversion**: Client-side display formatting

```dart
// Timezone-aware date handling
final nairobiTime = utcToZonedTime(DateTime.now(), 'Africa/Nairobi');
```

### Country-Specific Features
- **Country Entity**: Manages regional settings
- **Station Locations**: Country-based station management  
- **Currency/Units**: Locale-specific formatting
- **Regulatory Compliance**: Country-specific business rules

### Regional Configuration
```dart
// Country model with localization support
@freezed
class Country {
  factory Country({
    int? id,
    String? name,
    String? countryCode,  // ISO country codes
  });
}
```

## 🔐 Security & Authentication

### Token Management
- **JWT Tokens**: Secure API authentication
- **Refresh Tokens**: Automatic session renewal
- **Secure Storage**: Encrypted local token storage

### Role-Based Access Control
```dart
enum UserRole { swapper, rider, dispatcher }

// Dynamic UI based on user role
final isRider = authState.user?.role == 'rider';
```

### Data Security
- **API Interceptors**: Automatic token injection
- **Request Encryption**: HTTPS communication
- **Local Encryption**: Hive encrypted boxes

## 📱 Features

### Core Functionality
- **User Authentication**: Login with username/password
- **Shift Management**: Clock in/out with geofencing
- **Battery Requests**: Request and manage battery deliveries
- **Offline Operations**: Work without internet connectivity
- **Real-time Sync**: Automatic data synchronization

### Role-Specific Features

#### Swappers (Battery Station Agents)
- **Shift Tracking**: Start/end shifts with photo verification
- **Battery Requests**: Request battery deliveries to stations
- **Station Management**: Location-based operations
- **Performance Metrics**: Shift history and analytics

#### Riders (Delivery Personnel)  
- **Delivery Requests**: Receive and manage delivery tasks
- **Route Optimization**: GPS-based navigation
- **Status Updates**: Real-time delivery status tracking
- **Photo Verification**: Delivery confirmation photos

### Technical Features
- **Geofencing**: Station proximity validation
- **Photo Capture**: Camera integration with cropping
- **Push Notifications**: Firebase messaging
- **Connectivity Monitoring**: Automatic online/offline detection

## 🧪 Self-Review & Quality Assurance

### Code Quality Measures

#### 1. Static Analysis
```yaml
# analysis_options.yaml
include: package:very_good_analysis/analysis_options.yaml

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
```

#### 2. Architecture Validation
- ✅ **Dependency Direction**: Dependencies point inward
- ✅ **Single Responsibility**: Each class has one purpose  
- ✅ **Interface Segregation**: Small, focused interfaces
- ✅ **Dependency Injection**: Testable, loosely coupled code

#### 3. Error Handling
```dart
// Comprehensive error handling
try {
  await operation();
} on DioException catch (e) {
  emit(state.copyWith(error: e.response?.data['message']));
} catch (e) {
  emit(state.copyWith(error: 'An unexpected error occurred'));
}
```

#### 4. Testing Strategy
```
test/
├── unit/           # Business logic tests
├── widget/         # UI component tests  
├── integration/    # End-to-end tests
└── helpers/        # Test utilities
```

### Performance Optimizations

#### 1. State Management
- **Selective rebuilds**: BlocBuilder with selective listening
- **Efficient navigation**: Stateful shell routes
- **Memory management**: Proper stream disposal

#### 2. Network Optimization
- **Request caching**: Dio interceptors
- **Retry mechanisms**: Smart retry with exponential backoff
- **Connection pooling**: Persistent HTTP connections

#### 3. Storage Optimization
- **Lazy loading**: On-demand data fetching
- **Batch operations**: Efficient bulk updates
- **Storage compression**: Optimized Hive storage


## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.8.0+)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/zembo/zembo_agent_app.git
cd zembo_agent_app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Generate code**
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

4. **Environment setup**
```bash
# Copy environment file
cp .env.example .env

# Configure your environment variables
# API_BASE_URL=your_api_url
# FIREBASE_CONFIG=your_firebase_config
```

5. **Run the app**
```bash
# Development
flutter run --flavor development

# Staging  
flutter run --flavor staging

# Production
flutter run --flavor production
```

### Build Flavors

The app supports multiple build flavors for different environments:

- **Development**: Local development with debug features
- **Staging**: Pre-production testing environment  
- **Production**: Live production environment

## 📚 Documentation

### API Documentation
- [API Reference](docs/api.md)
- [Authentication Flow](docs/auth.md)
- [Data Models](docs/models.md)

### Development Guides
- [Contributing Guidelines](CONTRIBUTING.md)
- [Code Style Guide](docs/style-guide.md)
- [Testing Guide](docs/testing.md)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- **Documentation**: Check the docs/ directory
- **Issues**: Create a GitHub issue
- **Email**: support@zembo.energy
- **Slack**: #zembo-agent-app

---

**Built with ❤️ by Bob**
