import 'package:get/get.dart';
import 'package:gridlexapp/data/model/form_model.dart';

import 'package:sqflite/sqflite.dart';

import '../data/database/sqlite_service.dart';

class HomeScreenGetX extends GetxController{

  SqliteService sqliteService= SqliteService();


  List<FormModel> formData= [];

  Future<List<FormModel>> getLocalUserData()async{
    var homeData= await sqliteService.getItems();


   for(int i=0;i<homeData.length;i++){

     FormModel formModel = FormModel(
         id: homeData[i]['id'],
         status: homeData[i]['status'],
         mobileNo: homeData[i]['mobileNo'],
         profilePicLink: homeData[i]['profilePicLink'],
         dob: homeData[i]['dob'],
         name: homeData[i]['name'],
         email: homeData[i]['email']);
     formData.add(formModel);
   }
    update();
   return formData;



  }


}