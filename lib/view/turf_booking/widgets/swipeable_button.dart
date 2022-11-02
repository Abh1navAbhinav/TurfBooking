import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/booking_controller.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/view/turf_booking/widgets/custom_get_modal_sheet.dart';
import 'package:ticket_booking/view/turf_booking/widgets/swipeable_package/swipeable_button_logic.dart';

class SwipeAbleButtonWidget extends GetView<BookingController> {
  const SwipeAbleButtonWidget({super.key, required this.data});
  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SwipeableButtonView(
        onFinish: () {
          Get.bottomSheet(
            enableDrag: false,
            CustomGetModalSheet(data: data),
          );

          controller.isFinished.value = false;
        },
        isFinished: controller.isFinished.value,
        onWaitingProcess: () async {
          await Future.delayed(
            const Duration(seconds: 1),
          );
          controller.isFinished.value = true;
        },
        activeColor: Colors.green,
        buttonText: 'Drag to Confirm',
        buttontextstyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white.withOpacity(0.5),
        ),
        buttonWidget: Container(),
      ),
    );
  }
}
