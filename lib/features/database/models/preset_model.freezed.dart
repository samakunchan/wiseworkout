// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresetModel {

 List<BoundModel> get bounds;@JsonKey(name: 'preset_name') String get name; CategoryEnum get category;@JsonKey(name: 'trad_key') String get tradKey; int? get id;
/// Create a copy of PresetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetModelCopyWith<PresetModel> get copyWith => _$PresetModelCopyWithImpl<PresetModel>(this as PresetModel, _$identity);

  /// Serializes this PresetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetModel&&const DeepCollectionEquality().equals(other.bounds, bounds)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.tradKey, tradKey) || other.tradKey == tradKey)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bounds),name,category,tradKey,id);

@override
String toString() {
  return 'PresetModel(bounds: $bounds, name: $name, category: $category, tradKey: $tradKey, id: $id)';
}


}

/// @nodoc
abstract mixin class $PresetModelCopyWith<$Res>  {
  factory $PresetModelCopyWith(PresetModel value, $Res Function(PresetModel) _then) = _$PresetModelCopyWithImpl;
@useResult
$Res call({
 List<BoundModel> bounds,@JsonKey(name: 'preset_name') String name, CategoryEnum category,@JsonKey(name: 'trad_key') String tradKey, int? id
});




}
/// @nodoc
class _$PresetModelCopyWithImpl<$Res>
    implements $PresetModelCopyWith<$Res> {
  _$PresetModelCopyWithImpl(this._self, this._then);

  final PresetModel _self;
  final $Res Function(PresetModel) _then;

/// Create a copy of PresetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bounds = null,Object? name = null,Object? category = null,Object? tradKey = null,Object? id = freezed,}) {
  return _then(_self.copyWith(
bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as List<BoundModel>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryEnum,tradKey: null == tradKey ? _self.tradKey : tradKey // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PresetModel].
extension PresetModelPatterns on PresetModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresetModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresetModel value)  $default,){
final _that = this;
switch (_that) {
case _PresetModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresetModel value)?  $default,){
final _that = this;
switch (_that) {
case _PresetModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BoundModel> bounds, @JsonKey(name: 'preset_name')  String name,  CategoryEnum category, @JsonKey(name: 'trad_key')  String tradKey,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresetModel() when $default != null:
return $default(_that.bounds,_that.name,_that.category,_that.tradKey,_that.id);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BoundModel> bounds, @JsonKey(name: 'preset_name')  String name,  CategoryEnum category, @JsonKey(name: 'trad_key')  String tradKey,  int? id)  $default,) {final _that = this;
switch (_that) {
case _PresetModel():
return $default(_that.bounds,_that.name,_that.category,_that.tradKey,_that.id);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BoundModel> bounds, @JsonKey(name: 'preset_name')  String name,  CategoryEnum category, @JsonKey(name: 'trad_key')  String tradKey,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _PresetModel() when $default != null:
return $default(_that.bounds,_that.name,_that.category,_that.tradKey,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresetModel implements PresetModel {
  const _PresetModel({required final  List<BoundModel> bounds, @JsonKey(name: 'preset_name') required this.name, required this.category, @JsonKey(name: 'trad_key') this.tradKey = 'NO_TRANSLATION_AVAILABLE', this.id}): _bounds = bounds;
  factory _PresetModel.fromJson(Map<String, dynamic> json) => _$PresetModelFromJson(json);

 final  List<BoundModel> _bounds;
@override List<BoundModel> get bounds {
  if (_bounds is EqualUnmodifiableListView) return _bounds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bounds);
}

@override@JsonKey(name: 'preset_name') final  String name;
@override final  CategoryEnum category;
@override@JsonKey(name: 'trad_key') final  String tradKey;
@override final  int? id;

/// Create a copy of PresetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresetModelCopyWith<_PresetModel> get copyWith => __$PresetModelCopyWithImpl<_PresetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresetModel&&const DeepCollectionEquality().equals(other._bounds, _bounds)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.tradKey, tradKey) || other.tradKey == tradKey)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bounds),name,category,tradKey,id);

@override
String toString() {
  return 'PresetModel(bounds: $bounds, name: $name, category: $category, tradKey: $tradKey, id: $id)';
}


}

/// @nodoc
abstract mixin class _$PresetModelCopyWith<$Res> implements $PresetModelCopyWith<$Res> {
  factory _$PresetModelCopyWith(_PresetModel value, $Res Function(_PresetModel) _then) = __$PresetModelCopyWithImpl;
@override @useResult
$Res call({
 List<BoundModel> bounds,@JsonKey(name: 'preset_name') String name, CategoryEnum category,@JsonKey(name: 'trad_key') String tradKey, int? id
});




}
/// @nodoc
class __$PresetModelCopyWithImpl<$Res>
    implements _$PresetModelCopyWith<$Res> {
  __$PresetModelCopyWithImpl(this._self, this._then);

  final _PresetModel _self;
  final $Res Function(_PresetModel) _then;

/// Create a copy of PresetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bounds = null,Object? name = null,Object? category = null,Object? tradKey = null,Object? id = freezed,}) {
  return _then(_PresetModel(
bounds: null == bounds ? _self._bounds : bounds // ignore: cast_nullable_to_non_nullable
as List<BoundModel>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryEnum,tradKey: null == tradKey ? _self.tradKey : tradKey // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
