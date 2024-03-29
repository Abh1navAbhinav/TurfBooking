import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/controller/booking_controller.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';
import 'package:ticket_booking/view/turf_description/widgets/turf_name_and_location.dart';

class CustomGetModalSheet extends GetView<BookingController> {
  const CustomGetModalSheet({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        TurfNameAndLocation(datum: data),
        const SizedBox(height: 20),
        Container(
          color: Colors.green.withOpacity(0.06),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '   Booked for',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Text(
                '${controller.selectedDate}    ',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'Booked time\'s',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        const Divider(),
        controller.selectedSlots.isEmpty
            ? const Text(
                '\n\n\n\nNo Timeslots Selected',
                style: TextStyle(
                  color: Colors.red,
                ),
              )
            : Expanded(
                child: Wrap(
                  children: List.generate(
                    controller.selectedSlots.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green),
                          color: Colors.green.withOpacity(0.4),
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Center(
                          child: Text(
                            controller.selectedSlots[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.greenAccent.withOpacity(0.4),
                height: 50,
                child: Center(
                  child: Text(
                    "Total:  ₹ ${controller.totalAmount}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.openRazorpay();
                },
                child: Container(
                  color: Colors.green,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Book now',
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String parseDate(DateTime date) {
    return DateFormat.yMMMMd().format(date);
  }
}
