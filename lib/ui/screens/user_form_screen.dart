import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gridlexapp/constants/strings.dart';
import 'package:gridlexapp/data/helper/validation_helper.dart';
import 'package:gridlexapp/getX/user_form_getx.dart';
import 'package:gridlexapp/ui/widgets/custom_textfields.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/custom_button.dart';
import '../widgets/screen_background.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  var controller = Get.put(UserFormGetX());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (getContext) {
          return ScreenBackground(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    child: Image(
                      height: 100,
                      image: AssetImage("assets/avatar_doctor.png"),
                    ),
                  ),
                  Center(
                    child: TextButton(onPressed:() {
                     controller.loadImage(ImageSource.gallery);
                    },child: Text("Upload")),
                  ),
                  Text(
                    controller.profilePicError,
                    style: const TextStyle(color: Colors.red, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    inputType: TextInputType.name,
                    title: AppStrings.name,
                    controller: controller.nameController,
                    errorText: controller.nameError,
                    onChanged: (value) {
                      controller.checkName();
                    },
                  ),
                  CustomTextField(
                    inputType: TextInputType.number,
                    title: AppStrings.phoneNumber,
                    controller: controller.phoneController,
                    errorText: controller.phoneNoError,
                    onChanged: (value) {
                      controller.checkPhoneNumber();
                    },
                  ),
                  CustomTextField(
                      inputType: TextInputType.datetime,
                      controller: controller.dobController,
                      title: AppStrings.dateOfBirth,
                      errorText: controller.dobError,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          String value =
                              await ValidationHelper.selectDate(context);
                          controller.setDOBController(value);
                          controller.checkDOB();
                        },
                        icon: const Icon(Icons.calendar_month),
                      )),
                  CustomTextField(
                    inputType: TextInputType.emailAddress,
                    title: AppStrings.email,
                    controller: controller.emailController,
                    errorText: controller.emailError,
                    onChanged: (value) {
                      controller.checkEmail();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                    onPressed: controller.submit,
                    buttonText: AppStrings.submit,
                  )
                ],
              ),
            ),
          );
        });
  }
}
