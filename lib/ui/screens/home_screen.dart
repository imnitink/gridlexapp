import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gridlexapp/constants/dimens.dart';
import 'package:gridlexapp/ui/screens/event_details.dart';
import  'package:intl/intl.dart';

import '../../constants/colors.dart';
import '../../constants/query.dart';
import '../../constants/strings.dart';
import '../../getX/home_screen_getx.dart';
import '../router/app_router.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(HomeScreenGetX());

  @override
  void initState() {
    controller.getLocalUserData();
    controller.showDates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (getContext) {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                    backgroundColor: AppColors.appBlueColor,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    title: const Text("Events")),
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              showScrollableYearDialog();
                            },
                            child: Text(controller.selectedYear.toString())),
                        ElevatedButton(
                            onPressed: () {
                              showScrollableMonthDialog();
                            },
                            child: Text(controller.selectedMonth))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.dates.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20.0,top: 10),
                            child: Container(
                                height: 100,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        CustomText(
                                            text: controller.dates[index]
                                                .toString()),
                                        CustomText(text: controller.selectedMonth)
                                      ],
                                    ),
                                    SizedBox(width: 20,),
                                    GestureDetector(
                                      onTap: () {
                                        var date= controller.dates[index].toString()+'-'+controller.selectedMonth.toString()+'-'+controller.selectedYear.toString();
                                        controller.setDate(date);
                                        print(date);


                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EventDetails(date: date),
                                            ));
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          Text("14:00 1 Feb-2016"),
                                          Text("machine test start"),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                    )
                  ],
                )),
          );
        });
  }

  Widget setupMonthAlertDialogContainer() {
    return Container(
      // height: 300.0, // Change as per your requirement
      width: 400.0, // Change as per your requirement
      child: ListView.builder(
        //shrinkWrap: true,
        itemCount: controller.months.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              controller.setMonth(controller.months[index]);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Container(
                  child: Center(
                      child: Text(
                controller.months[index].toString(),
                style: TextStyle(color: AppColors.appBlueColor, fontSize: 28),
              ))),
            ),
          );
        },
      ),
    );
  }

  Widget setupYearAlertDialogContainer() {
    return Container(
      // height: 300.0, // Change as per your requirement
      width: 400.0, // Change as per your requirement
      child: ListView.builder(
        //shrinkWrap: true,
        itemCount: controller.years.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              controller.setYear(controller.years[index]);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Container(
                  child: Center(
                      child: Text(
                controller.years[index].toString(),
                style: TextStyle(color: AppColors.appBlueColor, fontSize: 28),
              ))),
            ),
          );
        },
      ),
    );
  }

  showScrollableYearDialog() {
    return Get.dialog(AlertDialog(
      title: Center(child: Text("Year")),
      content: setupYearAlertDialogContainer(),
    ));
  }

  showScrollableMonthDialog() {
    return Get.dialog(AlertDialog(
      title: Center(child: Text("Month")),
      content: setupMonthAlertDialogContainer(),
    ));
  }
}
