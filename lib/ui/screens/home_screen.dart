import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gridlexapp/constants/dimens.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../getX/home_screen_getx.dart';
import '../router/app_router.dart';
import '../widgets/custom_button.dart';
import '../widgets/screen_background.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (getContext) {
          return ScreenBackground(
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(AppRouterPath.userFormScreen);
                },
                child: Icon(Icons.add)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                right: Dimens.px28, left: Dimens.px28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 88,
                      ),
                      const Text(
                        "List of Submitted forms",
                        style: TextStyle(
                            fontSize: Dimens.px28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height:20,),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: controller.formData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                 // leading: const Icon(Icons.list),
                                  trailing: TextButton(
                                    child: Text("Open"),
                                    onPressed: () {
                                      Get.toNamed(AppRouterPath.viewScreen,
                                          arguments: controller.formData[index]);
                                    },
                                  ),
                                  title: Container(

                                      child: Text("${index + 1}. ${controller.formData[index].name} ")));
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
