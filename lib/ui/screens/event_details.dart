import 'package:flutter/material.dart';
import 'package:gridlexapp/getX/home_screen_getx.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
class EventDetails extends StatefulWidget {
  final String date;
  const EventDetails({Key? key,required this.date}) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  final controller= Get.put(HomeScreenGetX());

  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar:  AppBar(
        leading: TextButton(child: Text("Back",style: TextStyle(color: Colors.white,fontSize: 18),),onPressed: (){
          Navigator.pop(context);
        }),
          backgroundColor: AppColors.appBlueColor,
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: const Text("Event Detail")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Date & Time",style: TextStyle(fontSize: 20),),
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                child: TextField(
                  readOnly: true,
                  controller: controller.timeController,
                  onTap: ()async{
                    String value = await selectTime(context);
                    controller.setTime(value);
                  },
                  decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color: Colors.grey
                       ),
                         borderRadius: BorderRadius.circular(10.0),
                     )

                  ),
                ),
              )),
              Text(widget.date,style: TextStyle(fontSize: 20))
            ],
          ),
          Row(
            children: [
              Text("Title",style: TextStyle(fontSize: 20)),
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                child: TextField(
                  controller: controller.titleController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      )

                  ),
                ),
              )),
            ],
          ),
          Text("Description",style: TextStyle(fontSize: 20)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            child: TextField(
              controller: controller.descriptionController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  )

              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: TextButton(

          onPressed: (){
            controller.submit();
          },child: Text("Save")),
    ));


  }
  static selectTime(BuildContext context) async {
    DateTime dateTime = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.fromDateTime(dateTime);
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime.toString() != "null") {
      String time = "${pickedTime!.hour}:${pickedTime.minute}";
      return time;
    } else {
      return "";
    }
  }

}
