# CHANGELOG wiseworkout

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
