import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/controller/location_controller.dart';
import 'package:ticket_booking/view/home_page/widgets/greeting.dart';
import 'package:ticket_booking/view/search/widget/search_icon.dart';
import 'package:ticket_booking/view/home_page/widgets/carousel_slider.dart';
import 'package:ticket_booking/view/home_page/widgets/near_you_list.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final homePageController = Get.put(HomeController());
  final locationPageController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Stack(
          children: [
            const Positioned(
              top: 20,
              bottom: 10,
              child: Greetings(),
            ),
            SearchIconwidget(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on,
            ),
            Obx(
              () => Text(
                locationPageController.currentAddress.toString(),
              ),
            ),
          ],
        ),
        CarouselSliderWidget(),
        const SizedBox(height: 50),
        const NearYouList(
          heading: 'Near you',
          indexs: 1,
        ),
        const SizedBox(height: 15),
        const NearYouList(
          heading: 'Popular',
          indexs: 1,
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}