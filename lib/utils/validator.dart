abstract class Validator<T> {
  bool validate(T value);
  String get errorMessage;
}

abstract class ValidatorChain<T> {
  final List<Validator<T>> validators;
  ValidatorChain(this.validators);
  bool validate(T value);
}

class BooleanValidatorChain<T> extends ValidatorChain<T> {
  BooleanValidatorChain(List<Validator<T>> validators) : super(validators);

  @override
  bool validate(T value) {
    for (final validator in validators)
      if (!validator.validate(value)) return false;
    return true;
  }
}

class ValidatorResult {
  final List<ValidationException> exceptions = [];
  bool get hasErrors => exceptions.isNotEmpty;
}

class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);
}

class NotNull<T> implements Validator<T> {
  const NotNull();
  @override
  bool validate(T value) => value != null;
  @override
  String get errorMessage => 'Null';
}

class StringNotEmpty implements Validator<String> {
  const StringNotEmpty();
  @override
  bool validate(String value) => value.isNotEmpty;

  @override
  String get errorMessage => 'Empty';
}

class StringMinLength implements Validator<String> {
  final int length;
  const StringMinLength(this.length);
  @override
  bool validate(String value) => value.length >= length;

  @override
  String get errorMessage => 'Too short';
}

class ValidableValue<T> {
  final T value;
  final ValidatorChain<T> _chain;

  ValidableValue(this.value, this._chain);

  static ValidableValue email(String email) {
    return ValidableValue<String>(
      email,
      BooleanValidatorChain(Validators.email),
    );
  }

  static ValidableValue password(String password) {
    return ValidableValue<String>(
      password,
      BooleanValidatorChain(Validators.password),
    );
  }

  static ValidableValue notEmpty(String name) {
    return ValidableValue<String>(
      name,
      BooleanValidatorChain(Validators.notEmpty),
    );
  }

  bool get isValid => _chain.validate(value);
}

abstract class Validators {
  Validators._();

  static const List<Validator<String>> email = [
    NotNull(),
    StringNotEmpty(),
  ];
  static const List<Validator<String>> password = [
    NotNull(),
    StringNotEmpty(),
    StringMinLength(6),
  ];
  static const List<Validator<String>> notEmpty = [
    NotNull(),
    StringNotEmpty(),
  ];
}
