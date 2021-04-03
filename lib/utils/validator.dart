class Validators {
  static String min1char(String v) =>
      v.isNotEmpty ? null : "Cannot be empty";
}
