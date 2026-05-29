# CHANGELOG wiseworkout

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
