extension CapExtension on String {
  //first letter only
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';

  //all letter in string
  String get allInCaps => this.toUpperCase();

  //first letter for each word in a string
  String get titleCase => this.isNotEmpty
      ? this
          .split(' ')
          .map((word) =>
              (word.length > 0 ? word[0].toUpperCase() : '') +
              (word.length > 1 ? word.substring(1) : ''))
          .join(' ')
      : '';
}
