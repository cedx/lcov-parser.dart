part of lcov;

class Parser {

  /// TODO
  Future<Map> parse(String coverage) {
    List<Map> data = [];
    Map item;

    List<String> lines = ['end_of_record'];
    lines.addAll(coverage.split(new RegExp(r'\r?\n')));
    lines.forEach((String line) {
      line = line.trim();

      if (line.contains('end_of_record')) {
        data.add(item);
        item = {
          'lines': {
            'details': [],
            'found': 0,
            'hit': 0
          },
          'functions': {
            'details': [],
            'found': 0,
            'hit': 0
          },
          'branches': {
            'details': [],
            'found': 0,
            'hit': 0
          }
        };
      }
    });

    return null;
  }
}
