class ValidatedValue<T> {
  final T value;
  final bool isValid;

  const ValidatedValue({this.value, this.isValid});
}