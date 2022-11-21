import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gridlexapp/ui/widgets/getx_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

import '../data/database/sqlite_service.dart';
import '../data/helper/validation_helper.dart';
import '../data/model/form_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class UserFormGetX extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  String nameError = '';
  String phoneNoError = '';
  String dobError = '';
  String emailError = '';
  String profilePicError = '';
  bool isLoading = false;

  setNameController(String value) {
    nameController.text = value;
    update();
  }

  setPhoneController(String value) {
    phoneController.text = value;
    update();
  }

  setDOBController(String value) {
    dobController.text = value;
    update();
  }

  setEmailController(String value) {
    emailController.text = value;
    update();
  }

  setLoading(value) {
    isLoading = value;
  }

  checkName() {
    nameError =
        ValidationHelper.validateFirstNameController(nameController.text);
    update();
  }

  checkPhoneNumber() {
    phoneNoError =
        ValidationHelper.validateMobileNumberController(phoneController.text);
    update();
  }

  checkDOB() {
    dobError = ValidationHelper.validateCalendarController(dobController.text);
    update();
  }

  checkEmail() {
    emailError = ValidationHelper.validateEmail(emailController.text);
    update();
  }

  checkProfilePic() {
    profilePicError =
        ValidationHelper.validateUploadController(filePath);
    update();
  }

  SqliteService sqliteService = SqliteService();

  Future<int> createItem(FormModel formModel) async {
    int result = 0;
    final Database db = await sqliteService.initializeDB();
    final id = await db.insert('Form', formModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  resetAll() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    dobController = TextEditingController();
    emailController = TextEditingController();
    statusController = TextEditingController();

    nameError = '';
    phoneNoError = '';
    dobError = '';
    emailError = '';
    profilePicError = '';
    filePath="";
  }

  String filePath = "";
  ImagePicker imagePicker = ImagePicker();
  loadImage(ImageSource imageSource) async {
    XFile? xFile = await imagePicker.pickImage(source: imageSource);
    if (xFile!.path.isNotEmpty) {
      File file = File(xFile.path);
      filePath = file.path;
      print(filePath);
      update();
    } else {
      GetXUI.errorSnackBar("No file selected");
    }
  }



  checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {

      GetXUI.errorSnackBar("Device not connected to any network");
      return;
    }
  }

  submit() {
    checkConnectivity();
    checkName();
    checkPhoneNumber();
    checkDOB();
    checkEmail();
    checkProfilePic();
    if (nameError.isNotEmpty ||
        phoneNoError.isNotEmpty ||
        dobError.isNotEmpty ||
        emailError.isNotEmpty ||
        filePath.isNotEmpty) {
      GetXUI.errorSnackBar("Please fill all the details");
    } else {
      setLoading(true);

      FormModel formModel = FormModel(
          name: nameController.text,
          dob: dobController.text,
          profilePicLink: filePath,
          mobileNo: phoneController.text,
          email: emailController.text,
          status: 'local');

      Future<int> i = createItem(formModel);
      if (i == 0) {
        GetXUI.successSnackBar("Form Could not be submitted!");
      } else {
        GetXUI.successSnackBar("Form submitted succesfully!");
      }
      setLoading(false);

      // sqliteService.getItems();

    }
  }
}
