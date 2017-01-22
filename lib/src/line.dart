part of lcov;

/// Provides the coverage data of lines.
class LineCoverage {

  /// Creates a new line coverage.
  LineCoverage([this.found = 0, this.hit = 0, List<LineData> data]): data = data ?? [];

  /// Creates a new line coverage from the specified [map] in JSON format.
  LineCoverage.fromJson(Map<String, dynamic> map):
    data = map['data'] is List<Map<String, int>> ? map['data'].map((item) => new LineData.fromJson(item)).toList() : [],
    found = map['found'] is int ? map['found'] : 0,
    hit = map['hit'] is int ? map['hit'] : 0;

  /// The coverage data.
  final List<LineData> data;

  /// The number of instrumented lines.
  int found;

  /// The number of lines with a non-zero execution count.
  int hit;

  /// Converts this object to a map in JSON format.
  Map<String, dynamic> toJson() => {
    'data': data.map((item) => item.toJson()).toList(),
    'found': found,
    'hit': hit
  };

  /// Returns a string representation of this object.
  @override
  String toString() {
    var buffer = new StringBuffer();
    if (data.isNotEmpty) buffer..writeAll(data, '\n')..writeln();
    buffer.writeln('${Token.linesFound}:$found');
    buffer.write('${Token.linesHit}:$hit');
    return buffer.toString();
  }
}

/// Provides details for line coverage.
class LineData {

  /// Creates a new line data.
  LineData([this.lineNumber = 0, this.executionCount = 0, this.checksum = '']);

  /// Creates a new line data from the specified [map] in JSON format.
  LineData.fromJson(Map<String, dynamic> map):
    checksum = map['checksum'] is String ? map['checksum'] : '',
    executionCount = map['executionCount'] is int ? map['executionCount'] : 0,
    lineNumber = map['lineNumber'] is int ? map['lineNumber'] : 0;

  /// The data checksum.
  String checksum;

  /// The execution count.
  int executionCount;

  /// The line number.
  int lineNumber;

  /// Converts this object to a map in JSON format.
  Map<String, dynamic> toJson() => {
    'checksum': checksum,
    'executionCount': executionCount,
    'lineNumber': lineNumber
  };

  /// Returns a string representation of this object.
  @override
  String toString() {
    var value = '${Token.lineData}:$lineNumber,$executionCount';
    return checksum.isEmpty ? value : '$value,$checksum';
  }
}
