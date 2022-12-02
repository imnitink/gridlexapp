import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gridlexapp/data/model/form_model.dart';
import 'package:intl/intl.dart';

import 'package:sqflite/sqflite.dart';

import '../data/database/sqlite_service.dart';
import '../data/helper/validation_helper.dart';
import '../ui/widgets/getx_ui.dart';

class HomeScreenGetX extends GetxController {
  SqliteService sqliteService = SqliteService();

  List<FormModel> formData = [];

  List<int> dates = [];

  List<String> months= ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  List<int> years = [2016,2017,2018,2019,2020,2021,2022,2023,2024,2025];
  var selectedDate='1-Feb-2016';
  var selectedYear=2016;
  var selectedMonth="Jan";
  var selectedTime="";

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  String timeError = '';
  String dateError = '';
  String titleError = '';
  String descriptionError = '';
  bool isLoading = false;

  setMonth(value){
    selectedMonth=value;
    showDates();
    update();
  }

  setYear(value){
    selectedYear=value;
    update();
  }

  setDate(value){
    selectedDate=value;
    update();
  }

  setTime(value){
    timeController.text=value;
    selectedTime=value;
    update();
  }
  showDates(){
    dates.clear();
    if(selectedMonth=='Apr'|| selectedMonth=='Jun'||selectedMonth=='Sep'||selectedMonth=='Nov'){
      for(int i=1;i<=30;i++){
        dates.add(i);
      }
    }else if(selectedMonth=='Feb'){
      for(int i=1;i<=28;i++){
        dates.add(i);
      }
    }else{
      for(int i=1;i<=31;i++){
        dates.add(i);
      }
    }
  }

  Future<List<FormModel>> getLocalUserData() async {
    var homeData = await sqliteService.getItems();

    for (int i = 0; i < homeData.length; i++) {
      FormModel formModel = FormModel(
          id: homeData[i]['id'],
         );
      formData.add(formModel);
    }
    update();
    return formData;
  }






  setLoading(value) {
    isLoading = value;
  }

   checkTitle() {
    titleError =
        ValidationHelper.validateFirstNameController(titleController.text);
    update();
  }
  checkDescription() {
    descriptionError =
        ValidationHelper.validateFirstNameController(titleController.text);
    update();
  }
  checkTime() {
    timeError =
        ValidationHelper.validateFirstNameController(titleController.text);
    update();
  }





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
          date: selectedDate,
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
