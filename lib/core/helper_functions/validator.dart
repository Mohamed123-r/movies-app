String? validateEmail(context, String? value) {
  if (value == null || value.isEmpty) {
    return "Email a void is empty";
  } else if (value.contains(
    RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ),
  )) {
    return null;
  } else {
    return "Email format is invalid";
  }
}

String? validatePassword(context, String? value) {
  RegExp regex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$',
  );
  if (value == null || value.isEmpty) {
    return "Password a void is empty";
  } else {
    if (!regex.hasMatch(value)) {
      if (!RegExp(r'[A-Z]').hasMatch(value)) {
        return "Must contain at least one uppercase letter [A-Z]";
      }
      if (!RegExp(r'[a-z]').hasMatch(value)) {
        return "Must contain at least one lowercase letter [a-z]";
      }
      if (!RegExp(r'[0-9]').hasMatch(value)) {
        return "Must contain at least one digit [0-9]";
      }
      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
        return "Must contain at least one special character [!@#\$&*~]";
      }
      if (value.length < 8) {
        return "Must be at least 8 characters long";
      }
      return null;
    } else {
      return null;
    }
  }
}

String? validateName(context,String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  } else if (value.length < 3) {
    return 'Name must be at least 3 characters';
  } else if (value.contains(RegExp(r'[0-9]')) || value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return 'Name should only contain letters';
  }
  return null;
}

String? validateAge(context,String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your age';
  }
  final age = int.tryParse(value);
  if (age == null) {
    return 'Enter a valid number';
  } else if (age < 12) {
    return 'Age must be at least 12';
  } else if (age > 70) {
    return 'Age must be less than 70';
  }
  return null;
}

String? validateAddress(context,String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your address';
  } else if (value.length < 5 || value.length > 100) {
    return 'Address must be between 5 and 100 characters';
  }
  return null;
}

String? validatePhone(context,String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  } else if (value.length < 10 || value.length > 11) {
    return 'Phone number must be 10-11 digits';
  }
  return null;
}