import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gridlexapp/data/model/form_model.dart';

import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import '../../constants/strings.dart';
import '../../getX/home_screen_getx.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfields.dart';
import '../widgets/screen_background.dart';

class ViewScreen extends StatefulWidget {

  final FormModel data;
  const ViewScreen({Key? key,required this.data}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {

  TextStyle textStyle = const TextStyle(fontWeight: FontWeight.w400, fontSize: 20);



  @override
  void initState(){

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

          return ScreenBackground(
            child:  Stack(
              children: [
                const Positioned(
                  top: Dimens.px20 * 2.5,
                  left: Dimens.px12 * 2,
                  child: CustomBackButton(
                    title: AppStrings.back,
                  ),
                ),
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
                        "View Details",
                        style: TextStyle(
                            fontSize: Dimens.px28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        readOnly: true,
                          inputType: TextInputType.text,
                          title: AppStrings.name,
                          controller: TextEditingController(text: widget.data.name!),),
                      CustomTextField(
                        readOnly: true,
                        inputType: TextInputType.text,
                        title: AppStrings.email,
                          controller: TextEditingController(text: widget.data.name!)),
                      CustomTextField(
                        readOnly: true,
                        inputType: TextInputType.text,
                        title: AppStrings.dateOfBirth,
                          controller: TextEditingController(text: widget.data.dob!)),
                      CustomTextField(
                        readOnly: true,
                        inputType: TextInputType.phone,
                        title: AppStrings.name,
                          controller: TextEditingController(text: widget.data.mobileNo!)),

                      SizedBox(
                        height: 8,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );

  }
}
