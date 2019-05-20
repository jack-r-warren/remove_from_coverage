// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Name extends Name {
  @override
  final String first;
  @override
  final String middle;
  @override
  final String last;

  factory _$Name([void Function(NameBuilder) updates]) =>
      (new NameBuilder()..update(updates)).build();

  _$Name._({this.first, this.middle, this.last}) : super._() {
    if (first == null) {
      throw new BuiltValueNullFieldError('Name', 'first');
    }
    if (middle == null) {
      throw new BuiltValueNullFieldError('Name', 'middle');
    }
    if (last == null) {
      throw new BuiltValueNullFieldError('Name', 'last');
    }
  }

  @override
  Name rebuild(void Function(NameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NameBuilder toBuilder() => new NameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Name &&
        first == other.first &&
        middle == other.middle &&
        last == other.last;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, first.hashCode), middle.hashCode), last.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Name')
          ..add('first', first)
          ..add('middle', middle)
          ..add('last', last))
        .toString();
  }
}

class NameBuilder implements Builder<Name, NameBuilder> {
  _$Name _$v;

  String _first;
  String get first => _$this._first;
  set first(String first) => _$this._first = first;

  String _middle;
  String get middle => _$this._middle;
  set middle(String middle) => _$this._middle = middle;

  String _last;
  String get last => _$this._last;
  set last(String last) => _$this._last = last;

  NameBuilder();

  NameBuilder get _$this {
    if (_$v != null) {
      _first = _$v.first;
      _middle = _$v.middle;
      _last = _$v.last;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Name other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Name;
  }

  @override
  void update(void Function(NameBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Name build() {
    final _$result =
        _$v ?? new _$Name._(first: first, middle: middle, last: last);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
