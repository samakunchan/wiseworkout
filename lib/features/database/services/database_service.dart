import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:wiseworkout/features/database/connection/connection.dart';
import 'package:wiseworkout/features/database/enums/enums.dart';
import 'package:wiseworkout/features/database/models/bound_model.dart';
import 'package:wiseworkout/features/database/models/preset_model.dart';
import 'package:wiseworkout/features/database/models/workout_history_model.dart';
import 'package:wiseworkout/features/database/services/fixtures.dart';
import 'package:wiseworkout/features/database/services/tables.dart';

part 'database_service.g.dart';

@DriftDatabase(tables: [Preset, Bound, Setting, History])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  /// PRESET
  // To get all presets with their bounds
  Future<List<PresetModel>> getAllPresets() async {
    final JoinedSelectStatement<HasResultSet, dynamic> query = select(preset).join([
      leftOuterJoin(bound, bound.presetId.equalsExp(preset.id)),
    ]);
    // ..orderBy([OrderingTerm.asc(preset.name)])

    final List<TypedResult> rows = await query.get();
    final Map<PresetData, List<BoundData>> presetsWithBounds = {};

    for (final TypedResult row in rows) {
      final PresetData presetData = row.readTable(preset);
      final BoundData? boundData = row.readTableOrNull(bound);

      final List<BoundData> boundsList = presetsWithBounds.putIfAbsent(presetData, () => []);
      if (boundData != null) {
        boundsList
          ..add(boundData)
          ..sort((BoundData a, BoundData b) => a.id.compareTo(b.id));
      }
    }

    return presetsWithBounds.entries.map(_buildPresetModel).toList();
  }

  // To watch all presets for changes
  Stream<List<PresetModel>> watchAllPresets() {
    final JoinedSelectStatement<HasResultSet, dynamic> query = select(preset).join([
      leftOuterJoin(bound, bound.presetId.equalsExp(preset.id)),
    ]);

    return query.watch().map((List<TypedResult> rows) {
      final Map<PresetData, List<BoundData>> presetsWithBounds = {};

      for (final TypedResult row in rows) {
        final PresetData presetData = row.readTable(preset);
        final BoundData? boundData = row.readTableOrNull(bound);

        final List<BoundData> boundsList = presetsWithBounds.putIfAbsent(presetData, () => []);
        if (boundData != null) {
          boundsList.add(boundData);
        }
      }

      return presetsWithBounds.entries.map(_buildPresetModel).toList();
    });
  }

  // To get a single preset
  Future<PresetModel> getPreset({required int presetId}) async {
    final JoinedSelectStatement<HasResultSet, dynamic> query = select(preset).join([
      leftOuterJoin(bound, bound.presetId.equalsExp(preset.id)),
    ])..where(preset.id.equals(presetId));

    final List<TypedResult> rows = await query.get();

    if (rows.isEmpty) {
      throw Exception('Preset with id $presetId not found');
    }

    final Map<PresetData, List<BoundData>> presetsWithBounds = {};

    for (final TypedResult row in rows) {
      final PresetData presetData = row.readTable(preset);
      final BoundData? boundData = row.readTableOrNull(bound);

      final boundsList = presetsWithBounds.putIfAbsent(presetData, () => []);
      if (boundData != null) {
        boundsList.add(boundData);
      }
    }

    // Since we queried for a single preset ID, there will be only one entry in the map.
    return _buildPresetModel(presetsWithBounds.entries.first);
  }

  // To create a new preset
  Future<int> createPreset(PresetCompanion presetCompanion) => into(preset).insert(presetCompanion);

  // To update a preset
  Future<bool> updatePreset(PresetCompanion presetCompanion) => update(preset).replace(presetCompanion);

  // To delete a preset
  Future<int> deletePreset(int id) => (delete(preset)..where(($PresetTable table) => table.id.equals(id))).go();

  /// BOUND
  // To get all bounds for a preset
  Future<List<BoundData>> getBoundsForPreset({required int presetId}) =>
      (select(bound)..where(($BoundTable table) => table.presetId.equals(presetId))).get();

  // To watch all bounds for a preset
  Stream<List<BoundData>> watchBoundsForPreset({required int presetId}) =>
      (select(bound)..where(($BoundTable table) => table.presetId.equals(presetId))).watch();

  // To create a new bound
  Future<int> createBound(BoundCompanion boundCompanion) => into(bound).insert(boundCompanion);

  // To update a bound
  Future<bool> updateBound(BoundCompanion boundCompanion) => update(bound).replace(boundCompanion);

  // To delete a bound
  Future<int> deleteBound(int id) => (delete(bound)..where(($BoundTable table) => table.id.equals(id))).go();

  /// History
  // To get all workout history
  Future<List<WorkoutHistoryModel>> getAllHistories() async {
    final SimpleSelectStatement<$HistoryTable, HistoryData> query = select(history)
      ..orderBy([(t) => OrderingTerm(expression: t.date)]);

    final List<HistoryData> rows = await query.get();

    return rows.map(_buildHistoryModel).toList();
  }

  // To watch all workout history
  Stream<List<WorkoutHistoryModel>> watchAllHistories() {
    final SimpleSelectStatement<$HistoryTable, HistoryData> query = select(history)
      ..orderBy([(t) => OrderingTerm(expression: t.date)]);

    return query.watch().map((List<HistoryData> rows) {
      return rows.map(_buildHistoryModel).toList();
    });
  }

  // To create a new workout history
  Future<int> createHistory(HistoryCompanion historyCompanion) => into(history).insert(historyCompanion);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from == 1) {
        // This is where you would add any schema migration logic for
        // upgrading from version 1 to 2. For example, if you added a new
        // column to a table, you would use `m.addColumn()` here.
      }
    },
    beforeOpen: (OpeningDetails details) async {
      if (details.wasCreated) {
        // Pre-populate the database with presets and their bounds.

        await _loadFixtures();
      }
    },
  );

  /// Methods specials
  // Build preset model
  PresetModel _buildPresetModel(MapEntry<PresetData, List<BoundData>> entry) {
    final PresetData presetData = entry.key;
    final List<BoundData> boundDataList = entry.value;

    final List<Map<String, dynamic>> boundModels = boundDataList.map((BoundData data) {
      return BoundModel.fromJson(
        <String, dynamic>{
          'max': data.max,
          'min': data.min,
          'value': data.value,
          'bound_name': data.name,
          'id': data.id,
        },
      ).toJson();
    }).toList();

    return PresetModel.fromJson(
      <String, dynamic>{
        'preset_name': presetData.name,
        'category': presetData.category.value,
        'bounds': boundModels,
        'trad_key': presetData.tradKey,
        'id': presetData.id,
      },
    );
  }

  // Build workout history model
  WorkoutHistoryModel _buildHistoryModel(HistoryData data) {
    return WorkoutHistoryModel(
      id: data.id,
      timerPlanned: data.timerPlanned.toInt(),
      timerCompleted: data.timerCompleted.toInt(),
      pauseDuration: data.pauseDuration.toInt(),
      pause: data.pause.toInt(),
      date: data.date,
    );
  }

  Future<void> wipeWorkoutHistoryData() async {
    await delete(history).go();
    await customUpdate(
      'DELETE FROM sqlite_sequence WHERE name = ?',
      variables: [Variable.withString(history.entityName)],
    );
  }

  Future<void> dumpDatabaseForFixtures() async {
    await transaction(() async {
      // La liste 'allTables' est automatiquement générée par Drift
      // Elle contient toutes les classes Table que vous avez définies.
      for (final table in allTables) {
        // Exécuter la requête DELETE sur la table actuelle
        // Le .delete() sans filtre supprime toutes les lignes.
        await delete(table).go();
        if (kDebugMode) {
          print('🗑️ Table ${table.entityName} vidée.');
        }
        // Cette étape est nécessaire pour les tables utilisant AUTOINCREMENT.
        await customUpdate(
          'DELETE FROM sqlite_sequence WHERE name = ?',
          variables: [Variable.withString(table.entityName)],
        );
        if (kDebugMode) {
          print('🔢 Compteur d‘ID pour ${table.entityName} réinitialisé.');
        }
      }
      await _loadFixtures();
    });

    if (kDebugMode) {
      print('✅ Base de données vidée et prête pour les fixtures.');
    }
  }

  Future<void> dumpPresetsForFixtures() async {
    await transaction(() async {
      await delete(preset).go();
      await customUpdate(
        'DELETE FROM sqlite_sequence WHERE name = ?',
        variables: [Variable.withString(preset.entityName)],
      );

      await delete(bound).go();
      await customUpdate(
        'DELETE FROM sqlite_sequence WHERE name = ?',
        variables: [Variable.withString(bound.entityName)],
      );

      await _loadFixtures();
    });

    if (kDebugMode) {
      print('✅ Database presets reset to default fixtures.');
    }
  }

  Future<void> _loadFixtures() async {
    for (final PresetModel presetModel in kAllPresets) {
      if (kDebugMode) {
        print('Je load le preset : ${preset.name}');
      }
      final int presetIdCreated = await into(preset).insert(
        PresetCompanion.insert(
          name: presetModel.name,
          tradKey: presetModel.tradKey,
          category: presetModel.category,
        ),
      );

      BoundCompanion boundsCompanions(BoundModel bound) => BoundCompanion.insert(
        presetId: presetIdCreated,
        name: bound.name,
        min: bound.min,
        max: bound.max,
        value: bound.value,
      );

      await batch((Batch batch) {
        batch.insertAll(
          bound,
          presetModel.bounds.map(boundsCompanions).toList(),
        );
      });
    }
  }

  /// Méthode pour supprimer le fichier de base de données.
  Future<void> deleteDatabaseFile() async {
    if (kIsWeb) {
      if (kDebugMode) {
        print('🌐 La suppression de la base de données est gérée par IndexedDB sur le web.');
      }
      return;
    }
    if (kDebugMode) {
      print('💣 Tentative de suppression du fichier BDD...');
    }
    try {
      final File file = await resolveDbFile();
      final bool isFileExist = file.existsSync();

      if (isFileExist) {
        await file.delete();
        if (kDebugMode) {
          print('✅ Fichier BDD supprimé : ${file.path}');
        }
      } else {
        if (kDebugMode) {
          print('✅ Fichier BDD non trouvé, pas de suppression nécessaire.');
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('❌ ERREUR lors de la suppression de la BDD: $e');
      }
      rethrow;
    }
  }
}

Future<File> resolveDbFile() async {
  final Directory dbFolder = await getApplicationDocumentsDirectory();
  return File(p.join(dbFolder.path, 'wiseworkout.sqlite'));
}

/// Must be in this file
/// Type Converters
class CategoryEnumConverter extends TypeConverter<CategoryEnum, String> {
  const CategoryEnumConverter();

  @override
  CategoryEnum fromSql(String fromDb) {
    return CategoryEnum.values.firstWhere(
      (CategoryEnum category) => category.value == fromDb,
    );
  }

  @override
  String toSql(CategoryEnum value) {
    return value.value;
  }
}

class StatusEnumConverter extends TypeConverter<StatusEnum, String> {
  const StatusEnumConverter();

  @override
  StatusEnum fromSql(String fromDb) {
    return StatusEnum.values.firstWhere(
      (StatusEnum status) => status.value == fromDb,
    );
  }

  @override
  String toSql(StatusEnum value) {
    return value.value;
  }
}

class SoundStatusEnumConverter extends TypeConverter<SoundStatusEnum, String> {
  const SoundStatusEnumConverter();

  @override
  SoundStatusEnum fromSql(String fromDb) {
    return SoundStatusEnum.values.firstWhere(
      (SoundStatusEnum soundStatus) => soundStatus.value == fromDb,
    );
  }

  @override
  String toSql(SoundStatusEnum value) {
    return value.value;
  }
}

CategoryEnum categoryFromJson(String value) {
  return CategoryEnum.values.firstWhere(
    (CategoryEnum cat) => cat.value == value,
    orElse: () => CategoryEnum.sport,
  );
}
