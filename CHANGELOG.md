# CHANGELOG wiseworkout

## 🚀 0.7.0 - 01/06/2026

### Added
- Created the Settings feature package under `lib/features/settings` with a full suite of reactive components:
  - `SettingsScreen` scrollable settings page layout.
  - Namespaced keyboard input modular widgets: `TimerSetUpClickableUnit`, `TimerSetUpKey`, `TimerSetUpNumericPad`, and `TimerSetUpValidationButton`.
  - Core settings custom widgets: `SettingHeader`, `SettingBoundSlider`, `SettingSetsButtons`, `SettingSummarize`, `SettingSwitchesTile`, and `SettingSaveButton`.
  - Shared typography elements: `SettingLabelText`, `SettingValueText`, and `SettingValueTextClickable`.
- Implemented `loadFromCache` in `WorkoutSettingsStore` to fetch cached settings at startup and instantly populate all reactive signals.

### Changed
- Refactored `TimerSetUpScreen` to strip all nested helper methods, delegating layout assembly and distinct haptic playbacks (light/medium impacts) to custom namespaced widgets.
- Upgraded deprecated `Watch` wrappers in sliders, switch tiles, set buttons, and summary widgets to the modern, performant `SignalBuilder` class.
- Modified `main.dart` to make `main()` asynchronous and await pre-loading configuration from cache before rendering.
- Embedded a Settings navigation button (`Icons.settings`) in the top info row of `TimerScreen`.

### Fixed
- Fixed pre-existing linter warnings in `workout_engine_store.dart`, including unawaited futures (awaiting `reset()`), removing obsolete switch statement `break`s in compliance with Dart 3 switch specifications, and wrapping background triggers in `unawaited` blocks.
- Fixed a `discarded_futures` warning inside the numeric keypad haptic functions by making callbacks fully asynchronous.

## 🚀 0.6.0 - 01/06/2026

### Added
- Standardized modern Wasm-based SQLite initialization for web platforms using `WasmDatabase.open` in `lib/features/database/connection/web.dart` to bypass legacy `sql.js` requirements.
- Placed fully compiled `sqlite3.wasm` and `worker.dart.js` (compiled from `worker.dart` using Dart compiler hooks) directly in the `web/` folder for immediate local debugging.
- Added visual Architecture & Unidirectional Dependency Flow mermaid diagram to `README.md`.

### Changed
- Restructured the modular project architecture by transferring all workout state management controllers (`WorkoutEngineStore` and `WorkoutSettingsStore`) and configuration models (`TimerStatus` enum, `TimerConfigurationModel`) out of the `sound` feature and directly into `lib/features/timer/`.
- Refactored `SoundService` to make it a generic, stateless, standalone audio asset helper with zero circular dependencies on workout stores.
- Updated all dependency injections and watching imports cleanly.
- Migrated deprecated `.watch(context)` signal API calls in `TimerScreen` to the modern, implicit signal value tracking method by extending `SignalWidget` and using `.value`.

### Fixed
- Resolved `Could not access the sql.js javascript library` runtime crash on the Web.
- Fixed a `MIME type` WebAssembly compilation error on Chrome caused by empty placeholder symlinks for `sqlite3.wasm`.
- Prevented saving empty log rows to the database history when resetting a session before it has ticked.

## 🚀 0.5.0 - 01/06/2026

### Added
- Created the core Timer screen feature scaffold (`lib/features/timer`) including the Main Timer Screen and its dedicated sub-widgets (play, pause, stop buttons, circular/classic display countdown elements, headers, and footer set counters) designed as pure UI components with no direct signals dependencies.
- Created the core History feature scaffold (`lib/features/history`) containing the Workout History Screen and widgets (card summary, tabular rows) designed to accept custom data lists cleanly.
- Introduced `ListWorkoutHistoryExtension` (`lib/core/extensions/list_extension.dart`) to handle workout metrics (today's sessions, streak counters, and average session times).
- Established a global PageView screens composition helper (`AppHelper` in `lib/features/helpers.dart`) exposing the `getScreens` static constructor to elegantly orchestrate multiple features.

### Changed
- Upgraded the project package dependencies in `pubspec.yaml` to their latest compatible major versions: `signals` (`^7.1.0`), `signals_flutter` (`^7.1.0`), `signals_core` (`^7.0.0`), `device_info_plus` (`^13.1.0`), `fl_chart` (`^1.2.0`), `package_info_plus` (`^10.1.0`), `upgrader` (`^13.4.0`), and `very_good_analysis` (`^10.1.0`).
- Refactored `workout_engine_store.dart` and `workout_settings_store.dart` to migrate the deprecated `debugLabel` property to the modern `options: SignalOptions(name: ...)` API signature.
- Optimized `integer_extension.dart` to use the truncating division operator (`~/`) in compliance with the updated static analysis rule constraints.

### Fixed
- Resolved a critical compile-time failure on Chrome (Web) caused by `package:sqlite3` FFI imports on unsupported web environments, by introducing a conditional-import database connection orchestrator (`lib/features/database/connection/`).
- Fixed an `Unexpected null value` runtime exception when rendering screens accessing localizations inside `MaterialApp`, by registering `localizationsDelegates` and `supportedLocales` in `lib/main.dart`.

## 🚀 0.4.0 - 01/06/2026

### Added
- Integrated the Drift SQLite database feature with pre-populated configurations (`kAllPresets`) and modular schemas (`Preset`, `Bound`, `Setting`, `History`) under `lib/features/database/`.
- Reorganized the database service, tables, and fixtures into a dedicated `services/` subfolder.
- Re-architected workout state management by splitting settings from live execution countdowns into two highly isolated instance-based stores: `WorkoutSettingsStore` (Configuration role) and `WorkoutEngineStore` (Runtime role) under `lib/features/sound/signals/`.
- Introduced a central state enum (`TimerStatus`) and automated computed derived statuses (`isRunning`, `isReseted`) inside the engine store to eliminate race conditions.
- Implemented `SoundService` and `CacheService` utilizing lazy DI singletons and key-restricted caching under `lib/features/sound/` and `lib/features/cache/`.
- Established a global dependency injection locator (`setupLocator()` inside `lib/features/di/services/service_locator.dart`) leveraging `get_it` to cleanly manage all singleton services.
- Added comprehensive Dartdoc documentation (`///` comments) to explain the signals architecture and store responsibilities.

### Changed
- Refactored `database.dart` to `database_service.dart` for cleaner service-level semantics.

### Fixed
- Resolved a critical build compilation failure (`'dart compile' does not support build hooks`) under the project's older Dart SDK (`^3.10.1`) by specifying dependency overrides for `drift`, `drift_dev`, `sqlite3`, `sqlite3_flutter_libs`, and `path_provider_android`.

## 🚀 0.3.0 - 01/06/2026

### Added
- Configured multi-language localization setup for five languages: English (`app_en.arb`), French (`app_fr.arb`), Spanish (`app_es.arb`), Chinese (`app_zh.arb`), and German (`app_de.arb` as placeholder for custom `zr` locale).
- Created a custom `BuildContextExtension` inside `lib/core/extensions/context_extension.dart` exposing both `context.localization` and `context.localizations` to enable clean and convenient translation access.
- Created `l10n.yaml` to configure the automated i18n class generator.

### Changed
- N/A

### Fixed
- N/A

## 🚀 0.2.0 - 29/05/2026

### Added
- Imported the full theme folder (`lib/core/themes`) from `sekuence` and refactored all package import pathways to match `wiseworkout`.

### Changed
- N/A

### Fixed
- Resolved a pre-existing linter warning in the default template `lib/main.dart` regarding parameter ordering (`always_put_required_named_parameters_first`).

## 🚀 0.1.0 - 29/05/2026

### Added
- Migrated packages from `sekuence`:
  - State management: `signals`, `signals_flutter`, `signals_core`.
  - Database & Local caching: `drift`, `sqlite3_flutter_libs`, `shared_preferences`.
  - UI/UX & Media: `fl_chart`, `audioplayers`, `country_flags`, `flutter_markdown`, `fluttertoast`, `webview_flutter`.
  - Utility & Services: `wakelock_plus`, `package_info_plus`, `path`, `path_provider`, `get_it`, `firebase_core`, `flutter_dotenv`, `feedback`, `device_info_plus`, `upgrader`.
- Core packages for functional architecture & networking:
  - `dio` (robust HTTP client).
  - `dartz` (functional programming structure / Either pattern).
  - `mockito` (dependency mocking for testing).
- Enabled automated localization support in `pubspec.yaml`.

### Changed
- Replaced the default linter setup with the highly strict `very_good_analysis` ruleset, customized metrics, and generated file exclusions in `analysis_options.yaml`.

### Fixed
- N/A
