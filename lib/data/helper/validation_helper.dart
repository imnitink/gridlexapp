import 'package:flutter/material.dart';

class ValidationHelper {
  static selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return child!;
        });
    return newSelectedDate.toString().substring(0, 10);
  }
  static String validateMobileNumberController(String mobileNumber) {
    if (mobileNumber.isEmpty || mobileNumber.length < 10) {
      return "Please enter valid mobile number";
    } else {
      return "";
    }
  }


  static String validateUploadController(String value) {
    if (value.isEmpty) {
      return "Please select a file";
    } else {
      return "";
    }
  }

  static String validateFirstNameController(String firstName) {
    if (firstName.isEmpty) {
      return "Please enter valid value";
    } else {
      return "";
    }
  }


  static String validateCalendarController(String dob) {
    if (dob.isEmpty) {
      return "Please enter valid date";
    } else {
      return "";
    }
  }





  static String validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return "Please enter the phone number";
    } else if (value.length < 10) {
      return "Please enter a valid phone number";
    } else {
      return "";
    }
  }

  static String validateEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return "Please enter a valid email";
    } else {
      return "";
    }
  }
}
