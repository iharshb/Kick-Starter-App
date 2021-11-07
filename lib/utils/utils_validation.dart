import 'package:flutter/material.dart';
import 'package:kickstarter/utils/constants/constants_strings.dart';

class ValidationUtils {
  // Validation of Email Field
  String? validateEmail(String value) {
    RegExp? regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.trim().isEmpty) {
      return Strings.emailRequired;
    } else if (!regex.hasMatch(value.trim())) {
      return "This Email Address is not valid";
    }
    return null;
  }

//Validation of Password
  String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      return "Password is Required";
    } else if (value.trim().length < 6) {
      return 'Password should ne more than 6.';
    }
    return null;
  }

  String? validateCheckNumber(String value) {
    if (value.trim().isEmpty) {
      return "Check Number is Required";
    }
    return null;
  }

  // Validation of Password Matching
  String? validatePasswordMatching(GlobalKey<FormFieldState> key, String value) {
    var password = key.currentState?.value;

    if (value.isEmpty) {
      return "Password is Required";
    } else if (value != password) {
      return 'Password is not matching';
    }
    return null;
  }

  // Validation of Email Field
  String? validateMobile(String value) {
    if (value.trim().isEmpty) {
      return "Mobile Number is Required";
    } else if (value.trim().length < 6 && value.trim().length < 10) {
      return "Enter Valid Mobile Number.";
    }
    return null;
  }

  // Validation of empty Field
  String? validateValue(String value, String errorMessage) {
    if (value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
