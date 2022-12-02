import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gridlexapp/ui/widgets/getx_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../data/database/sqlite_service.dart';
import '../data/helper/validation_helper.dart';
import '../data/model/form_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class EventDetailsGetX extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  String timeError = '';
  String dateError = '';
  String titleError = '';
  String descriptionError = '';
  bool isLoading = false;





  setLoading(value) {
    isLoading = value;
  }

 /* checkName() {
    nameError =
        ValidationHelper.validateFirstNameController(nameController.text);
    update();
  }*/



  SqliteService sqliteService = SqliteService();

  Future<int> createItem(FormModel formModel) async {
    int result = 0;
    final Database db = await sqliteService.initializeDB();
    final id = await db.insert('Form', formModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  resetAll() {
    titleController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();
    descriptionController = TextEditingController();


  }







  submit() {
   // checkConnectivity();
    String tdata = DateFormat("HH:mm").format(DateTime.now());

    if (dateError.isNotEmpty ||
        timeError.isNotEmpty ||
        titleError.isNotEmpty ||
        descriptionError.isNotEmpty) {
      GetXUI.errorSnackBar("Please fill all the details");
    } else {
      setLoading(true);

      FormModel formModel = FormModel(
          date: "",
          time: tdata,
        title: titleController.text,
        description: descriptionController.text
          );

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
