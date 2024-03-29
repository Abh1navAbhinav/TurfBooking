import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/view/home_page/widgets/near_you_image.dart';
import 'package:ticket_booking/view/turf_description/turf_description.dart';

import '../../../model/home/all_turf/datum.dart';

class NearYouList extends GetView<HomeController> {
  const NearYouList({super.key, required this.heading});
  final String heading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "  $heading",
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: SizedBox(
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.nearByTurf.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final Datum newList = controller.nearByTurf[index];

                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => TurfDescription(datum: newList),
                      );
                    },
                    child: NearYouImage(
                      data: newList,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
