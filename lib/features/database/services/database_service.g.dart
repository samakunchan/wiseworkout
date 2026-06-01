// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_service.dart';

// ignore_for_file: type=lint
class $PresetTable extends Preset with TableInfo<$PresetTable, PresetData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PresetTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'preset_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tradKeyMeta = const VerificationMeta(
    'tradKey',
  );
  @override
  late final GeneratedColumn<String> tradKey = GeneratedColumn<String>(
    'trad_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CategoryEnum, String> category =
      GeneratedColumn<String>(
        'category',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CategoryEnum>($PresetTable.$convertercategory);
  @override
  List<GeneratedColumn> get $columns => [id, name, tradKey, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preset';
  @override
  VerificationContext validateIntegrity(
    Insertable<PresetData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('preset_name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['preset_name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('trad_key')) {
      context.handle(
        _tradKeyMeta,
        tradKey.isAcceptableOrUnknown(data['trad_key']!, _tradKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_tradKeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PresetData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PresetData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preset_name'],
      )!,
      tradKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trad_key'],
      )!,
      category: $PresetTable.$convertercategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}category'],
        )!,
      ),
    );
  }

  @override
  $PresetTable createAlias(String alias) {
    return $PresetTable(attachedDatabase, alias);
  }

  static TypeConverter<CategoryEnum, String> $convertercategory =
      const CategoryEnumConverter();
}

class PresetData extends DataClass implements Insertable<PresetData> {
  final int id;
  final String name;
  final String tradKey;
  final CategoryEnum category;
  const PresetData({
    required this.id,
    required this.name,
    required this.tradKey,
    required this.category,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['preset_name'] = Variable<String>(name);
    map['trad_key'] = Variable<String>(tradKey);
    {
      map['category'] = Variable<String>(
        $PresetTable.$convertercategory.toSql(category),
      );
    }
    return map;
  }

  PresetCompanion toCompanion(bool nullToAbsent) {
    return PresetCompanion(
      id: Value(id),
      name: Value(name),
      tradKey: Value(tradKey),
      category: Value(category),
    );
  }

  factory PresetData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PresetData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      tradKey: serializer.fromJson<String>(json['tradKey']),
      category: serializer.fromJson<CategoryEnum>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'tradKey': serializer.toJson<String>(tradKey),
      'category': serializer.toJson<CategoryEnum>(category),
    };
  }

  PresetData copyWith({
    int? id,
    String? name,
    String? tradKey,
    CategoryEnum? category,
  }) => PresetData(
    id: id ?? this.id,
    name: name ?? this.name,
    tradKey: tradKey ?? this.tradKey,
    category: category ?? this.category,
  );
  PresetData copyWithCompanion(PresetCompanion data) {
    return PresetData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      tradKey: data.tradKey.present ? data.tradKey.value : this.tradKey,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PresetData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tradKey: $tradKey, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, tradKey, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PresetData &&
          other.id == this.id &&
          other.name == this.name &&
          other.tradKey == this.tradKey &&
          other.category == this.category);
}

class PresetCompanion extends UpdateCompanion<PresetData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> tradKey;
  final Value<CategoryEnum> category;
  const PresetCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.tradKey = const Value.absent(),
    this.category = const Value.absent(),
  });
  PresetCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String tradKey,
    required CategoryEnum category,
  }) : name = Value(name),
       tradKey = Value(tradKey),
       category = Value(category);
  static Insertable<PresetData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? tradKey,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'preset_name': name,
      if (tradKey != null) 'trad_key': tradKey,
      if (category != null) 'category': category,
    });
  }

  PresetCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? tradKey,
    Value<CategoryEnum>? category,
  }) {
    return PresetCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      tradKey: tradKey ?? this.tradKey,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['preset_name'] = Variable<String>(name.value);
    }
    if (tradKey.present) {
      map['trad_key'] = Variable<String>(tradKey.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(
        $PresetTable.$convertercategory.toSql(category.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PresetCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tradKey: $tradKey, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $BoundTable extends Bound with TableInfo<$BoundTable, BoundData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoundTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _minMeta = const VerificationMeta('min');
  @override
  late final GeneratedColumn<double> min = GeneratedColumn<double>(
    'min',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maxMeta = const VerificationMeta('max');
  @override
  late final GeneratedColumn<double> max = GeneratedColumn<double>(
    'max',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'bound_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _presetIdMeta = const VerificationMeta(
    'presetId',
  );
  @override
  late final GeneratedColumn<int> presetId = GeneratedColumn<int>(
    'preset_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES preset (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, min, max, value, name, presetId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bound';
  @override
  VerificationContext validateIntegrity(
    Insertable<BoundData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('min')) {
      context.handle(
        _minMeta,
        min.isAcceptableOrUnknown(data['min']!, _minMeta),
      );
    } else if (isInserting) {
      context.missing(_minMeta);
    }
    if (data.containsKey('max')) {
      context.handle(
        _maxMeta,
        max.isAcceptableOrUnknown(data['max']!, _maxMeta),
      );
    } else if (isInserting) {
      context.missing(_maxMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('bound_name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['bound_name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('preset_id')) {
      context.handle(
        _presetIdMeta,
        presetId.isAcceptableOrUnknown(data['preset_id']!, _presetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_presetIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BoundData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoundData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      min: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}min'],
      )!,
      max: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}max'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bound_name'],
      )!,
      presetId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}preset_id'],
      )!,
    );
  }

  @override
  $BoundTable createAlias(String alias) {
    return $BoundTable(attachedDatabase, alias);
  }
}

class BoundData extends DataClass implements Insertable<BoundData> {
  final int id;
  final double min;
  final double max;
  final double value;
  final String name;
  final int presetId;
  const BoundData({
    required this.id,
    required this.min,
    required this.max,
    required this.value,
    required this.name,
    required this.presetId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['min'] = Variable<double>(min);
    map['max'] = Variable<double>(max);
    map['value'] = Variable<double>(value);
    map['bound_name'] = Variable<String>(name);
    map['preset_id'] = Variable<int>(presetId);
    return map;
  }

  BoundCompanion toCompanion(bool nullToAbsent) {
    return BoundCompanion(
      id: Value(id),
      min: Value(min),
      max: Value(max),
      value: Value(value),
      name: Value(name),
      presetId: Value(presetId),
    );
  }

  factory BoundData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoundData(
      id: serializer.fromJson<int>(json['id']),
      min: serializer.fromJson<double>(json['min']),
      max: serializer.fromJson<double>(json['max']),
      value: serializer.fromJson<double>(json['value']),
      name: serializer.fromJson<String>(json['name']),
      presetId: serializer.fromJson<int>(json['presetId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'min': serializer.toJson<double>(min),
      'max': serializer.toJson<double>(max),
      'value': serializer.toJson<double>(value),
      'name': serializer.toJson<String>(name),
      'presetId': serializer.toJson<int>(presetId),
    };
  }

  BoundData copyWith({
    int? id,
    double? min,
    double? max,
    double? value,
    String? name,
    int? presetId,
  }) => BoundData(
    id: id ?? this.id,
    min: min ?? this.min,
    max: max ?? this.max,
    value: value ?? this.value,
    name: name ?? this.name,
    presetId: presetId ?? this.presetId,
  );
  BoundData copyWithCompanion(BoundCompanion data) {
    return BoundData(
      id: data.id.present ? data.id.value : this.id,
      min: data.min.present ? data.min.value : this.min,
      max: data.max.present ? data.max.value : this.max,
      value: data.value.present ? data.value.value : this.value,
      name: data.name.present ? data.name.value : this.name,
      presetId: data.presetId.present ? data.presetId.value : this.presetId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoundData(')
          ..write('id: $id, ')
          ..write('min: $min, ')
          ..write('max: $max, ')
          ..write('value: $value, ')
          ..write('name: $name, ')
          ..write('presetId: $presetId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, min, max, value, name, presetId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoundData &&
          other.id == this.id &&
          other.min == this.min &&
          other.max == this.max &&
          other.value == this.value &&
          other.name == this.name &&
          other.presetId == this.presetId);
}

class BoundCompanion extends UpdateCompanion<BoundData> {
  final Value<int> id;
  final Value<double> min;
  final Value<double> max;
  final Value<double> value;
  final Value<String> name;
  final Value<int> presetId;
  const BoundCompanion({
    this.id = const Value.absent(),
    this.min = const Value.absent(),
    this.max = const Value.absent(),
    this.value = const Value.absent(),
    this.name = const Value.absent(),
    this.presetId = const Value.absent(),
  });
  BoundCompanion.insert({
    this.id = const Value.absent(),
    required double min,
    required double max,
    required double value,
    required String name,
    required int presetId,
  }) : min = Value(min),
       max = Value(max),
       value = Value(value),
       name = Value(name),
       presetId = Value(presetId);
  static Insertable<BoundData> custom({
    Expression<int>? id,
    Expression<double>? min,
    Expression<double>? max,
    Expression<double>? value,
    Expression<String>? name,
    Expression<int>? presetId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (min != null) 'min': min,
      if (max != null) 'max': max,
      if (value != null) 'value': value,
      if (name != null) 'bound_name': name,
      if (presetId != null) 'preset_id': presetId,
    });
  }

  BoundCompanion copyWith({
    Value<int>? id,
    Value<double>? min,
    Value<double>? max,
    Value<double>? value,
    Value<String>? name,
    Value<int>? presetId,
  }) {
    return BoundCompanion(
      id: id ?? this.id,
      min: min ?? this.min,
      max: max ?? this.max,
      value: value ?? this.value,
      name: name ?? this.name,
      presetId: presetId ?? this.presetId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (min.present) {
      map['min'] = Variable<double>(min.value);
    }
    if (max.present) {
      map['max'] = Variable<double>(max.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (name.present) {
      map['bound_name'] = Variable<String>(name.value);
    }
    if (presetId.present) {
      map['preset_id'] = Variable<int>(presetId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BoundCompanion(')
          ..write('id: $id, ')
          ..write('min: $min, ')
          ..write('max: $max, ')
          ..write('value: $value, ')
          ..write('name: $name, ')
          ..write('presetId: $presetId')
          ..write(')'))
        .toString();
  }
}

class $SettingTable extends Setting with TableInfo<$SettingTable, SettingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _presetIdMeta = const VerificationMeta(
    'presetId',
  );
  @override
  late final GeneratedColumn<int> presetId = GeneratedColumn<int>(
    'preset_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES preset (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<StatusEnum, String> mode =
      GeneratedColumn<String>(
        'mode',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<StatusEnum>($SettingTable.$convertermode);
  @override
  late final GeneratedColumnWithTypeConverter<SoundStatusEnum, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<SoundStatusEnum>($SettingTable.$converterstatus);
  @override
  List<GeneratedColumn> get $columns => [id, presetId, mode, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'setting';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('preset_id')) {
      context.handle(
        _presetIdMeta,
        presetId.isAcceptableOrUnknown(data['preset_id']!, _presetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_presetIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      presetId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}preset_id'],
      )!,
      mode: $SettingTable.$convertermode.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}mode'],
        )!,
      ),
      status: $SettingTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
    );
  }

  @override
  $SettingTable createAlias(String alias) {
    return $SettingTable(attachedDatabase, alias);
  }

  static TypeConverter<StatusEnum, String> $convertermode =
      const StatusEnumConverter();
  static TypeConverter<SoundStatusEnum, String> $converterstatus =
      const SoundStatusEnumConverter();
}

class SettingData extends DataClass implements Insertable<SettingData> {
  final int id;
  final int presetId;
  final StatusEnum mode;
  final SoundStatusEnum status;
  const SettingData({
    required this.id,
    required this.presetId,
    required this.mode,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['preset_id'] = Variable<int>(presetId);
    {
      map['mode'] = Variable<String>($SettingTable.$convertermode.toSql(mode));
    }
    {
      map['status'] = Variable<String>(
        $SettingTable.$converterstatus.toSql(status),
      );
    }
    return map;
  }

  SettingCompanion toCompanion(bool nullToAbsent) {
    return SettingCompanion(
      id: Value(id),
      presetId: Value(presetId),
      mode: Value(mode),
      status: Value(status),
    );
  }

  factory SettingData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingData(
      id: serializer.fromJson<int>(json['id']),
      presetId: serializer.fromJson<int>(json['presetId']),
      mode: serializer.fromJson<StatusEnum>(json['mode']),
      status: serializer.fromJson<SoundStatusEnum>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'presetId': serializer.toJson<int>(presetId),
      'mode': serializer.toJson<StatusEnum>(mode),
      'status': serializer.toJson<SoundStatusEnum>(status),
    };
  }

  SettingData copyWith({
    int? id,
    int? presetId,
    StatusEnum? mode,
    SoundStatusEnum? status,
  }) => SettingData(
    id: id ?? this.id,
    presetId: presetId ?? this.presetId,
    mode: mode ?? this.mode,
    status: status ?? this.status,
  );
  SettingData copyWithCompanion(SettingCompanion data) {
    return SettingData(
      id: data.id.present ? data.id.value : this.id,
      presetId: data.presetId.present ? data.presetId.value : this.presetId,
      mode: data.mode.present ? data.mode.value : this.mode,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingData(')
          ..write('id: $id, ')
          ..write('presetId: $presetId, ')
          ..write('mode: $mode, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, presetId, mode, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingData &&
          other.id == this.id &&
          other.presetId == this.presetId &&
          other.mode == this.mode &&
          other.status == this.status);
}

class SettingCompanion extends UpdateCompanion<SettingData> {
  final Value<int> id;
  final Value<int> presetId;
  final Value<StatusEnum> mode;
  final Value<SoundStatusEnum> status;
  const SettingCompanion({
    this.id = const Value.absent(),
    this.presetId = const Value.absent(),
    this.mode = const Value.absent(),
    this.status = const Value.absent(),
  });
  SettingCompanion.insert({
    this.id = const Value.absent(),
    required int presetId,
    required StatusEnum mode,
    required SoundStatusEnum status,
  }) : presetId = Value(presetId),
       mode = Value(mode),
       status = Value(status);
  static Insertable<SettingData> custom({
    Expression<int>? id,
    Expression<int>? presetId,
    Expression<String>? mode,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (presetId != null) 'preset_id': presetId,
      if (mode != null) 'mode': mode,
      if (status != null) 'status': status,
    });
  }

  SettingCompanion copyWith({
    Value<int>? id,
    Value<int>? presetId,
    Value<StatusEnum>? mode,
    Value<SoundStatusEnum>? status,
  }) {
    return SettingCompanion(
      id: id ?? this.id,
      presetId: presetId ?? this.presetId,
      mode: mode ?? this.mode,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (presetId.present) {
      map['preset_id'] = Variable<int>(presetId.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(
        $SettingTable.$convertermode.toSql(mode.value),
      );
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $SettingTable.$converterstatus.toSql(status.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingCompanion(')
          ..write('id: $id, ')
          ..write('presetId: $presetId, ')
          ..write('mode: $mode, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $HistoryTable extends History with TableInfo<$HistoryTable, HistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _timerPlannedMeta = const VerificationMeta(
    'timerPlanned',
  );
  @override
  late final GeneratedColumn<double> timerPlanned = GeneratedColumn<double>(
    'timer_planned',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timerCompletedMeta = const VerificationMeta(
    'timerCompleted',
  );
  @override
  late final GeneratedColumn<double> timerCompleted = GeneratedColumn<double>(
    'timer_completed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pauseDurationMeta = const VerificationMeta(
    'pauseDuration',
  );
  @override
  late final GeneratedColumn<double> pauseDuration = GeneratedColumn<double>(
    'pause_duration',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pauseMeta = const VerificationMeta('pause');
  @override
  late final GeneratedColumn<double> pause = GeneratedColumn<double>(
    'pause',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    timerPlanned,
    timerCompleted,
    pauseDuration,
    pause,
    date,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timer_planned')) {
      context.handle(
        _timerPlannedMeta,
        timerPlanned.isAcceptableOrUnknown(
          data['timer_planned']!,
          _timerPlannedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timerPlannedMeta);
    }
    if (data.containsKey('timer_completed')) {
      context.handle(
        _timerCompletedMeta,
        timerCompleted.isAcceptableOrUnknown(
          data['timer_completed']!,
          _timerCompletedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timerCompletedMeta);
    }
    if (data.containsKey('pause_duration')) {
      context.handle(
        _pauseDurationMeta,
        pauseDuration.isAcceptableOrUnknown(
          data['pause_duration']!,
          _pauseDurationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pauseDurationMeta);
    }
    if (data.containsKey('pause')) {
      context.handle(
        _pauseMeta,
        pause.isAcceptableOrUnknown(data['pause']!, _pauseMeta),
      );
    } else if (isInserting) {
      context.missing(_pauseMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      timerPlanned: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}timer_planned'],
      )!,
      timerCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}timer_completed'],
      )!,
      pauseDuration: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pause_duration'],
      )!,
      pause: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pause'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
    );
  }

  @override
  $HistoryTable createAlias(String alias) {
    return $HistoryTable(attachedDatabase, alias);
  }
}

class HistoryData extends DataClass implements Insertable<HistoryData> {
  final int id;
  final double timerPlanned;
  final double timerCompleted;
  final double pauseDuration;
  final double pause;
  final DateTime date;
  const HistoryData({
    required this.id,
    required this.timerPlanned,
    required this.timerCompleted,
    required this.pauseDuration,
    required this.pause,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timer_planned'] = Variable<double>(timerPlanned);
    map['timer_completed'] = Variable<double>(timerCompleted);
    map['pause_duration'] = Variable<double>(pauseDuration);
    map['pause'] = Variable<double>(pause);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  HistoryCompanion toCompanion(bool nullToAbsent) {
    return HistoryCompanion(
      id: Value(id),
      timerPlanned: Value(timerPlanned),
      timerCompleted: Value(timerCompleted),
      pauseDuration: Value(pauseDuration),
      pause: Value(pause),
      date: Value(date),
    );
  }

  factory HistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryData(
      id: serializer.fromJson<int>(json['id']),
      timerPlanned: serializer.fromJson<double>(json['timerPlanned']),
      timerCompleted: serializer.fromJson<double>(json['timerCompleted']),
      pauseDuration: serializer.fromJson<double>(json['pauseDuration']),
      pause: serializer.fromJson<double>(json['pause']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timerPlanned': serializer.toJson<double>(timerPlanned),
      'timerCompleted': serializer.toJson<double>(timerCompleted),
      'pauseDuration': serializer.toJson<double>(pauseDuration),
      'pause': serializer.toJson<double>(pause),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  HistoryData copyWith({
    int? id,
    double? timerPlanned,
    double? timerCompleted,
    double? pauseDuration,
    double? pause,
    DateTime? date,
  }) => HistoryData(
    id: id ?? this.id,
    timerPlanned: timerPlanned ?? this.timerPlanned,
    timerCompleted: timerCompleted ?? this.timerCompleted,
    pauseDuration: pauseDuration ?? this.pauseDuration,
    pause: pause ?? this.pause,
    date: date ?? this.date,
  );
  HistoryData copyWithCompanion(HistoryCompanion data) {
    return HistoryData(
      id: data.id.present ? data.id.value : this.id,
      timerPlanned: data.timerPlanned.present
          ? data.timerPlanned.value
          : this.timerPlanned,
      timerCompleted: data.timerCompleted.present
          ? data.timerCompleted.value
          : this.timerCompleted,
      pauseDuration: data.pauseDuration.present
          ? data.pauseDuration.value
          : this.pauseDuration,
      pause: data.pause.present ? data.pause.value : this.pause,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryData(')
          ..write('id: $id, ')
          ..write('timerPlanned: $timerPlanned, ')
          ..write('timerCompleted: $timerCompleted, ')
          ..write('pauseDuration: $pauseDuration, ')
          ..write('pause: $pause, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, timerPlanned, timerCompleted, pauseDuration, pause, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryData &&
          other.id == this.id &&
          other.timerPlanned == this.timerPlanned &&
          other.timerCompleted == this.timerCompleted &&
          other.pauseDuration == this.pauseDuration &&
          other.pause == this.pause &&
          other.date == this.date);
}

class HistoryCompanion extends UpdateCompanion<HistoryData> {
  final Value<int> id;
  final Value<double> timerPlanned;
  final Value<double> timerCompleted;
  final Value<double> pauseDuration;
  final Value<double> pause;
  final Value<DateTime> date;
  const HistoryCompanion({
    this.id = const Value.absent(),
    this.timerPlanned = const Value.absent(),
    this.timerCompleted = const Value.absent(),
    this.pauseDuration = const Value.absent(),
    this.pause = const Value.absent(),
    this.date = const Value.absent(),
  });
  HistoryCompanion.insert({
    this.id = const Value.absent(),
    required double timerPlanned,
    required double timerCompleted,
    required double pauseDuration,
    required double pause,
    required DateTime date,
  }) : timerPlanned = Value(timerPlanned),
       timerCompleted = Value(timerCompleted),
       pauseDuration = Value(pauseDuration),
       pause = Value(pause),
       date = Value(date);
  static Insertable<HistoryData> custom({
    Expression<int>? id,
    Expression<double>? timerPlanned,
    Expression<double>? timerCompleted,
    Expression<double>? pauseDuration,
    Expression<double>? pause,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timerPlanned != null) 'timer_planned': timerPlanned,
      if (timerCompleted != null) 'timer_completed': timerCompleted,
      if (pauseDuration != null) 'pause_duration': pauseDuration,
      if (pause != null) 'pause': pause,
      if (date != null) 'date': date,
    });
  }

  HistoryCompanion copyWith({
    Value<int>? id,
    Value<double>? timerPlanned,
    Value<double>? timerCompleted,
    Value<double>? pauseDuration,
    Value<double>? pause,
    Value<DateTime>? date,
  }) {
    return HistoryCompanion(
      id: id ?? this.id,
      timerPlanned: timerPlanned ?? this.timerPlanned,
      timerCompleted: timerCompleted ?? this.timerCompleted,
      pauseDuration: pauseDuration ?? this.pauseDuration,
      pause: pause ?? this.pause,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timerPlanned.present) {
      map['timer_planned'] = Variable<double>(timerPlanned.value);
    }
    if (timerCompleted.present) {
      map['timer_completed'] = Variable<double>(timerCompleted.value);
    }
    if (pauseDuration.present) {
      map['pause_duration'] = Variable<double>(pauseDuration.value);
    }
    if (pause.present) {
      map['pause'] = Variable<double>(pause.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryCompanion(')
          ..write('id: $id, ')
          ..write('timerPlanned: $timerPlanned, ')
          ..write('timerCompleted: $timerCompleted, ')
          ..write('pauseDuration: $pauseDuration, ')
          ..write('pause: $pause, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PresetTable preset = $PresetTable(this);
  late final $BoundTable bound = $BoundTable(this);
  late final $SettingTable setting = $SettingTable(this);
  late final $HistoryTable history = $HistoryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    preset,
    bound,
    setting,
    history,
  ];
}

typedef $$PresetTableCreateCompanionBuilder =
    PresetCompanion Function({
      Value<int> id,
      required String name,
      required String tradKey,
      required CategoryEnum category,
    });
typedef $$PresetTableUpdateCompanionBuilder =
    PresetCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> tradKey,
      Value<CategoryEnum> category,
    });

final class $$PresetTableReferences
    extends BaseReferences<_$AppDatabase, $PresetTable, PresetData> {
  $$PresetTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BoundTable, List<BoundData>> _boundRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.bound,
    aliasName: $_aliasNameGenerator(db.preset.id, db.bound.presetId),
  );

  $$BoundTableProcessedTableManager get boundRefs {
    final manager = $$BoundTableTableManager(
      $_db,
      $_db.bound,
    ).filter((f) => f.presetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_boundRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SettingTable, List<SettingData>>
  _settingRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.setting,
    aliasName: $_aliasNameGenerator(db.preset.id, db.setting.presetId),
  );

  $$SettingTableProcessedTableManager get settingRefs {
    final manager = $$SettingTableTableManager(
      $_db,
      $_db.setting,
    ).filter((f) => f.presetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_settingRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PresetTableFilterComposer
    extends Composer<_$AppDatabase, $PresetTable> {
  $$PresetTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tradKey => $composableBuilder(
    column: $table.tradKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CategoryEnum, CategoryEnum, String>
  get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> boundRefs(
    Expression<bool> Function($$BoundTableFilterComposer f) f,
  ) {
    final $$BoundTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bound,
      getReferencedColumn: (t) => t.presetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BoundTableFilterComposer(
            $db: $db,
            $table: $db.bound,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> settingRefs(
    Expression<bool> Function($$SettingTableFilterComposer f) f,
  ) {
    final $$SettingTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setting,
      getReferencedColumn: (t) => t.presetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SettingTableFilterComposer(
            $db: $db,
            $table: $db.setting,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PresetTableOrderingComposer
    extends Composer<_$AppDatabase, $PresetTable> {
  $$PresetTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tradKey => $composableBuilder(
    column: $table.tradKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PresetTableAnnotationComposer
    extends Composer<_$AppDatabase, $PresetTable> {
  $$PresetTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get tradKey =>
      $composableBuilder(column: $table.tradKey, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CategoryEnum, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  Expression<T> boundRefs<T extends Object>(
    Expression<T> Function($$BoundTableAnnotationComposer a) f,
  ) {
    final $$BoundTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bound,
      getReferencedColumn: (t) => t.presetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BoundTableAnnotationComposer(
            $db: $db,
            $table: $db.bound,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> settingRefs<T extends Object>(
    Expression<T> Function($$SettingTableAnnotationComposer a) f,
  ) {
    final $$SettingTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setting,
      getReferencedColumn: (t) => t.presetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SettingTableAnnotationComposer(
            $db: $db,
            $table: $db.setting,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PresetTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PresetTable,
          PresetData,
          $$PresetTableFilterComposer,
          $$PresetTableOrderingComposer,
          $$PresetTableAnnotationComposer,
          $$PresetTableCreateCompanionBuilder,
          $$PresetTableUpdateCompanionBuilder,
          (PresetData, $$PresetTableReferences),
          PresetData,
          PrefetchHooks Function({bool boundRefs, bool settingRefs})
        > {
  $$PresetTableTableManager(_$AppDatabase db, $PresetTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PresetTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PresetTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PresetTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> tradKey = const Value.absent(),
                Value<CategoryEnum> category = const Value.absent(),
              }) => PresetCompanion(
                id: id,
                name: name,
                tradKey: tradKey,
                category: category,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String tradKey,
                required CategoryEnum category,
              }) => PresetCompanion.insert(
                id: id,
                name: name,
                tradKey: tradKey,
                category: category,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$PresetTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({boundRefs = false, settingRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (boundRefs) db.bound,
                if (settingRefs) db.setting,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (boundRefs)
                    await $_getPrefetchedData<
                      PresetData,
                      $PresetTable,
                      BoundData
                    >(
                      currentTable: table,
                      referencedTable: $$PresetTableReferences._boundRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$PresetTableReferences(db, table, p0).boundRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.presetId == item.id),
                      typedResults: items,
                    ),
                  if (settingRefs)
                    await $_getPrefetchedData<
                      PresetData,
                      $PresetTable,
                      SettingData
                    >(
                      currentTable: table,
                      referencedTable: $$PresetTableReferences
                          ._settingRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PresetTableReferences(db, table, p0).settingRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.presetId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PresetTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PresetTable,
      PresetData,
      $$PresetTableFilterComposer,
      $$PresetTableOrderingComposer,
      $$PresetTableAnnotationComposer,
      $$PresetTableCreateCompanionBuilder,
      $$PresetTableUpdateCompanionBuilder,
      (PresetData, $$PresetTableReferences),
      PresetData,
      PrefetchHooks Function({bool boundRefs, bool settingRefs})
    >;
typedef $$BoundTableCreateCompanionBuilder =
    BoundCompanion Function({
      Value<int> id,
      required double min,
      required double max,
      required double value,
      required String name,
      required int presetId,
    });
typedef $$BoundTableUpdateCompanionBuilder =
    BoundCompanion Function({
      Value<int> id,
      Value<double> min,
      Value<double> max,
      Value<double> value,
      Value<String> name,
      Value<int> presetId,
    });

final class $$BoundTableReferences
    extends BaseReferences<_$AppDatabase, $BoundTable, BoundData> {
  $$BoundTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PresetTable _presetIdTable(_$AppDatabase db) => db.preset.createAlias(
    $_aliasNameGenerator(db.bound.presetId, db.preset.id),
  );

  $$PresetTableProcessedTableManager get presetId {
    final $_column = $_itemColumn<int>('preset_id')!;

    final manager = $$PresetTableTableManager(
      $_db,
      $_db.preset,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_presetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BoundTableFilterComposer extends Composer<_$AppDatabase, $BoundTable> {
  $$BoundTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get min => $composableBuilder(
    column: $table.min,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get max => $composableBuilder(
    column: $table.max,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$PresetTableFilterComposer get presetId {
    final $$PresetTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.presetId,
      referencedTable: $db.preset,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PresetTableFilterComposer(
            $db: $db,
            $table: $db.preset,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BoundTableOrderingComposer
    extends Composer<_$AppDatabase, $BoundTable> {
  $$BoundTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get min => $composableBuilder(
    column: $table.min,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get max => $composableBuilder(
    column: $table.max,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$PresetTableOrderingComposer get presetId {
    final $$PresetTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.presetId,
      referencedTable: $db.preset,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PresetTableOrderingComposer(
            $db: $db,
            $table: $db.preset,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BoundTableAnnotationComposer
    extends Composer<_$AppDatabase, $BoundTable> {
  $$BoundTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get min =>
      $composableBuilder(column: $table.min, builder: (column) => column);

  GeneratedColumn<double> get max =>
      $composableBuilder(column: $table.max, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$PresetTableAnnotationComposer get presetId {
    final $$PresetTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.presetId,
      referencedTable: $db.preset,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PresetTableAnnotationComposer(
            $db: $db,
            $table: $db.preset,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BoundTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BoundTable,
          BoundData,
          $$BoundTableFilterComposer,
          $$BoundTableOrderingComposer,
          $$BoundTableAnnotationComposer,
          $$BoundTableCreateCompanionBuilder,
          $$BoundTableUpdateCompanionBuilder,
          (BoundData, $$BoundTableReferences),
          BoundData,
          PrefetchHooks Function({bool presetId})
        > {
  $$BoundTableTableManager(_$AppDatabase db, $BoundTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BoundTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BoundTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BoundTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> min = const Value.absent(),
                Value<double> max = const Value.absent(),
                Value<double> value = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> presetId = const Value.absent(),
              }) => BoundCompanion(
                id: id,
                min: min,
                max: max,
                value: value,
                name: name,
                presetId: presetId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double min,
                required double max,
                required double value,
                required String name,
                required int presetId,
              }) => BoundCompanion.insert(
                id: id,
                min: min,
                max: max,
                value: value,
                name: name,
                presetId: presetId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$BoundTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({presetId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (presetId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.presetId,
                                referencedTable: $$BoundTableReferences
                                    ._presetIdTable(db),
                                referencedColumn: $$BoundTableReferences
                                    ._presetIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BoundTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BoundTable,
      BoundData,
      $$BoundTableFilterComposer,
      $$BoundTableOrderingComposer,
      $$BoundTableAnnotationComposer,
      $$BoundTableCreateCompanionBuilder,
      $$BoundTableUpdateCompanionBuilder,
      (BoundData, $$BoundTableReferences),
      BoundData,
      PrefetchHooks Function({bool presetId})
    >;
typedef $$SettingTableCreateCompanionBuilder =
    SettingCompanion Function({
      Value<int> id,
      required int presetId,
      required StatusEnum mode,
      required SoundStatusEnum status,
    });
typedef $$SettingTableUpdateCompanionBuilder =
    SettingCompanion Function({
      Value<int> id,
      Value<int> presetId,
      Value<StatusEnum> mode,
      Value<SoundStatusEnum> status,
    });

final class $$SettingTableReferences
    extends BaseReferences<_$AppDatabase, $SettingTable, SettingData> {
  $$SettingTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PresetTable _presetIdTable(_$AppDatabase db) => db.preset.createAlias(
    $_aliasNameGenerator(db.setting.presetId, db.preset.id),
  );

  $$PresetTableProcessedTableManager get presetId {
    final $_column = $_itemColumn<int>('preset_id')!;

    final manager = $$PresetTableTableManager(
      $_db,
      $_db.preset,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_presetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SettingTableFilterComposer
    extends Composer<_$AppDatabase, $SettingTable> {
  $$SettingTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<StatusEnum, StatusEnum, String> get mode =>
      $composableBuilder(
        column: $table.mode,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<SoundStatusEnum, SoundStatusEnum, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$PresetTableFilterComposer get presetId {
    final $$PresetTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.presetId,
      referencedTable: $db.preset,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PresetTableFilterComposer(
            $db: $db,
            $table: $db.preset,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SettingTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingTable> {
  $$SettingTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$PresetTableOrderingComposer get presetId {
    final $$PresetTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.presetId,
      referencedTable: $db.preset,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PresetTableOrderingComposer(
            $db: $db,
            $table: $db.preset,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SettingTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingTable> {
  $$SettingTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<StatusEnum, String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SoundStatusEnum, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$PresetTableAnnotationComposer get presetId {
    final $$PresetTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.presetId,
      referencedTable: $db.preset,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PresetTableAnnotationComposer(
            $db: $db,
            $table: $db.preset,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SettingTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingTable,
          SettingData,
          $$SettingTableFilterComposer,
          $$SettingTableOrderingComposer,
          $$SettingTableAnnotationComposer,
          $$SettingTableCreateCompanionBuilder,
          $$SettingTableUpdateCompanionBuilder,
          (SettingData, $$SettingTableReferences),
          SettingData,
          PrefetchHooks Function({bool presetId})
        > {
  $$SettingTableTableManager(_$AppDatabase db, $SettingTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> presetId = const Value.absent(),
                Value<StatusEnum> mode = const Value.absent(),
                Value<SoundStatusEnum> status = const Value.absent(),
              }) => SettingCompanion(
                id: id,
                presetId: presetId,
                mode: mode,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int presetId,
                required StatusEnum mode,
                required SoundStatusEnum status,
              }) => SettingCompanion.insert(
                id: id,
                presetId: presetId,
                mode: mode,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SettingTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({presetId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (presetId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.presetId,
                                referencedTable: $$SettingTableReferences
                                    ._presetIdTable(db),
                                referencedColumn: $$SettingTableReferences
                                    ._presetIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SettingTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingTable,
      SettingData,
      $$SettingTableFilterComposer,
      $$SettingTableOrderingComposer,
      $$SettingTableAnnotationComposer,
      $$SettingTableCreateCompanionBuilder,
      $$SettingTableUpdateCompanionBuilder,
      (SettingData, $$SettingTableReferences),
      SettingData,
      PrefetchHooks Function({bool presetId})
    >;
typedef $$HistoryTableCreateCompanionBuilder =
    HistoryCompanion Function({
      Value<int> id,
      required double timerPlanned,
      required double timerCompleted,
      required double pauseDuration,
      required double pause,
      required DateTime date,
    });
typedef $$HistoryTableUpdateCompanionBuilder =
    HistoryCompanion Function({
      Value<int> id,
      Value<double> timerPlanned,
      Value<double> timerCompleted,
      Value<double> pauseDuration,
      Value<double> pause,
      Value<DateTime> date,
    });

class $$HistoryTableFilterComposer
    extends Composer<_$AppDatabase, $HistoryTable> {
  $$HistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get timerPlanned => $composableBuilder(
    column: $table.timerPlanned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get timerCompleted => $composableBuilder(
    column: $table.timerCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pauseDuration => $composableBuilder(
    column: $table.pauseDuration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pause => $composableBuilder(
    column: $table.pause,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoryTable> {
  $$HistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get timerPlanned => $composableBuilder(
    column: $table.timerPlanned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get timerCompleted => $composableBuilder(
    column: $table.timerCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pauseDuration => $composableBuilder(
    column: $table.pauseDuration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pause => $composableBuilder(
    column: $table.pause,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoryTable> {
  $$HistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get timerPlanned => $composableBuilder(
    column: $table.timerPlanned,
    builder: (column) => column,
  );

  GeneratedColumn<double> get timerCompleted => $composableBuilder(
    column: $table.timerCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pauseDuration => $composableBuilder(
    column: $table.pauseDuration,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pause =>
      $composableBuilder(column: $table.pause, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$HistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistoryTable,
          HistoryData,
          $$HistoryTableFilterComposer,
          $$HistoryTableOrderingComposer,
          $$HistoryTableAnnotationComposer,
          $$HistoryTableCreateCompanionBuilder,
          $$HistoryTableUpdateCompanionBuilder,
          (
            HistoryData,
            BaseReferences<_$AppDatabase, $HistoryTable, HistoryData>,
          ),
          HistoryData,
          PrefetchHooks Function()
        > {
  $$HistoryTableTableManager(_$AppDatabase db, $HistoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> timerPlanned = const Value.absent(),
                Value<double> timerCompleted = const Value.absent(),
                Value<double> pauseDuration = const Value.absent(),
                Value<double> pause = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
              }) => HistoryCompanion(
                id: id,
                timerPlanned: timerPlanned,
                timerCompleted: timerCompleted,
                pauseDuration: pauseDuration,
                pause: pause,
                date: date,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double timerPlanned,
                required double timerCompleted,
                required double pauseDuration,
                required double pause,
                required DateTime date,
              }) => HistoryCompanion.insert(
                id: id,
                timerPlanned: timerPlanned,
                timerCompleted: timerCompleted,
                pauseDuration: pauseDuration,
                pause: pause,
                date: date,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistoryTable,
      HistoryData,
      $$HistoryTableFilterComposer,
      $$HistoryTableOrderingComposer,
      $$HistoryTableAnnotationComposer,
      $$HistoryTableCreateCompanionBuilder,
      $$HistoryTableUpdateCompanionBuilder,
      (HistoryData, BaseReferences<_$AppDatabase, $HistoryTable, HistoryData>),
      HistoryData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PresetTableTableManager get preset =>
      $$PresetTableTableManager(_db, _db.preset);
  $$BoundTableTableManager get bound =>
      $$BoundTableTableManager(_db, _db.bound);
  $$SettingTableTableManager get setting =>
      $$SettingTableTableManager(_db, _db.setting);
  $$HistoryTableTableManager get history =>
      $$HistoryTableTableManager(_db, _db.history);
}
