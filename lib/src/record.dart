part of '../lcov.dart';

/// Provides the coverage data of a source file.
@JsonSerializable(explicitToJson: true)
class Record {

  /// Creates a new record with the specified source file.
  Record(this.sourceFile, {this.branches, this.functions, this.lines});

  /// Creates a new record from the specified [map] in JSON format.
  factory Record.fromJson(Map<String, dynamic> map) => _$RecordFromJson(map);

  /// The branch coverage.
  @JsonKey()
  BranchCoverage branches;

  /// The function coverage.
  @JsonKey()
  FunctionCoverage functions;

  /// The line coverage.
  @JsonKey()
  LineCoverage lines;

  /// The path to the source file.
  @JsonKey(defaultValue: '')
  final String sourceFile;

  /// Converts this object to a [Map] in JSON format.
  Map<String, dynamic> toJson() => _$RecordToJson(this);

  /// Returns a string representation of this object.
  @override
  String toString() {
    final buffer = StringBuffer('${Token.sourceFile}:$sourceFile')..writeln();
    if (functions != null) buffer.writeln(functions);
    if (branches != null) buffer.writeln(branches);
    if (lines != null) buffer.writeln(lines);
    buffer.write(Token.endOfRecord);
    return buffer.toString();
  }
}
