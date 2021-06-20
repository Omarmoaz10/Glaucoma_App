abstract class StringValidator{
  bool isValid(String value);
}
class NonEmptyStringValidators implements StringValidator{
  @override
  bool isValid(String value){
    return value.isNotEmpty;
  }
}
class TextValidators{
  final StringValidator firstNameValidator=NonEmptyStringValidators();
  final StringValidator lastNameValidator=NonEmptyStringValidators();
  final StringValidator emailValidator=NonEmptyStringValidators();
  final StringValidator passwordValidator=NonEmptyStringValidators();
  final StringValidator addressValidator=NonEmptyStringValidators();

  final StringValidator fullNameValidator=NonEmptyStringValidators();
  final StringValidator ageValidator=NonEmptyStringValidators();

  final String invalidFirstNameErrorText="FirstName can\'t be empty";
  final String invalidLastNameErrorText="LastName can\'t be empty";
  final String invalidEmailErrorText="Email can\'t be empty";
  final String invalidPasswordErrorText="Password can\'t be empty";

  final String invalidFullNameErrorText="FullName can\'t be empty";
  final String invalidAgeErrorText="Age can\'t be empty";

}