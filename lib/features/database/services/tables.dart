import 'package:drift/drift.dart';
import 'package:wiseworkout/features/database/services/database_service.dart';

// Table for PresetModel
class Preset extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('preset_name')();
  TextColumn get tradKey => text().named('trad_key')();
  TextColumn get category => text().map(const CategoryEnumConverter())();
}

// Table for BoundModel
class Bound extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get min => real()();
  RealColumn get max => real()();
  RealColumn get value => real()();
  TextColumn get name => text().named('bound_name')();
  IntColumn get presetId => integer().references(Preset, #id)();
}

// Table for SettingModel
class Setting extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get presetId => integer().references(Preset, #id)();
  TextColumn get mode => text().map(const StatusEnumConverter())();
  TextColumn get status => text().map(const SoundStatusEnumConverter())();
}

class History extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get timerPlanned => real()();
  RealColumn get timerCompleted => real()();
  RealColumn get pauseDuration => real()();
  RealColumn get pause => real()();
  DateTimeColumn get date => dateTime()();
}
