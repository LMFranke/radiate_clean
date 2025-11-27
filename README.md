# Radiate Clean

A student application for service management and scheduling, developed in Flutter. **Radiate Clean** allows you to manage clients, services, and schedules practically, with support for financial reports and customization.

---

##  Features

- ** Visual Agenda:** Visualize your appointments on an interactive calendar. Filter by day and view details like "Full Day" or "Half Day".
- ** Client Management:**
  - Complete registration with preferences and address.
  - **Click-to-Call:** Call the client directly from the app.
  - Data validation (phone number, mandatory fields).
- ** Service Management:**
  - Service registration with differentiated pricing.
  - **Safe Delete** option (secure deletion that preserves history).
- ** Smart Reports:**
  - Charts (Donut Chart) for financial analysis.
  - Filters by Period (Dates) and Type (By Client or By Service).
- ** Settings and Customization:**
  - **Themes:** Support for Light, Dark, and System Default themes.
  - **Security:** Option to enable a Login Screen with a password.
  - **Language:** Support for Portuguese (pt-BR) and English (en-US).
- ** Enhanced UX:**
  - Gesture navigation (Swipe) between tabs.
  - Event cancellation by dragging to the side (Dismissible).

---

##  Technologies Used

- **[Flutter](https://flutter.dev/)**: Main framework.
- **[Provider](https://pub.dev/packages/provider)**: State Management (MVVM/MVC Architecture).
- **[Drift](https://drift.simonbinder.eu/)**: Robust and reactive local SQLite database.
- **[Syncfusion Flutter Charts](https://pub.dev/packages/syncfusion_flutter_charts)**: Chart generation for reports.
- **[Shared Preferences](https://pub.dev/packages/shared_preferences)**: Persistence of simple settings (Theme, Login).
- **[Url Launcher](https://pub.dev/packages/url_launcher)**: Phone dialing functionality.
- **[Intl](https://pub.dev/packages/intl)**: Date and currency formatting.

---

##  Project Structure

The project follows a clean and decoupled architecture:

- `lib/controller/`: Business logic and state management (`ClientsController`, `EventController`, etc.).
- `lib/view/`: Application screens (`CalendarScreen`, `ReportScreen`, etc.).
- `lib/database/`: Table definitions and connection to the Drift database.
- `lib/model/`: Auxiliary data models.
- `lib/components/`: Reusable widgets (Dialogs, Cards, ListTiles).
- `lib/storage/`: Management of persistent settings.
- `lib/translate/`: Internationalization files (Strings).
