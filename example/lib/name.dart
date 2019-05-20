import 'package:built_value/built_value.dart';

// As [Name] implements [Built] from [built_value], that package needs to
// perform code generation. It generates code in a new file with the same
// name but with a '.g.dart' extension, so we must reference that file here.
part 'name.g.dart';

/// Class representing a name.
abstract class Name implements Built<Name, NameBuilder> {
  /// The first part of the name.
  String get first;

  /// The middle part of the name.
  String get middle;

  /// The last part of the name.
  String get last;

  /// [built_value]-required reference (its generated concrete class requires
  /// this).
  Name._();

  /// Factory constructor referencing the [built_value] generated concrete
  /// class.
  factory Name([updates(NameBuilder b)]) = _$Name;
}
