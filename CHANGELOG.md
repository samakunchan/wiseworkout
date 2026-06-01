# CHANGELOG wiseworkout

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
