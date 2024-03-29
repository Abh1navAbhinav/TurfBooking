import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/controller/location_controller.dart';
import 'package:ticket_booking/controller/search_controller.dart';
import 'package:ticket_booking/global_constants/scroll_behaviour.dart';
import 'package:ticket_booking/view/home_page/widgets/all_turf.dart';
import 'package:ticket_booking/view/home_page/widgets/greeting.dart';
import 'package:ticket_booking/view/search/search.dart';
import 'package:ticket_booking/view/search/widget/search_icon.dart';
import 'package:ticket_booking/view/home_page/widgets/carousel_slider.dart';
import 'package:ticket_booking/view/home_page/widgets/near_you_list.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final homePageController = Get.put(HomeController());
  final locationPageController = Get.put(LocationController());
  final searchPageController = Get.put(SearchPageController());
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.homeRefreshIndicatorFunction(),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Obx(
            () => AnimatedPhysicalModel(
              shape: BoxShape.rectangle,
              elevation: searchPageController.isSearchClicked.value ? 5 : 0,
              color: Colors.white,
              shadowColor: Colors.greenAccent,
              duration: const Duration(seconds: 1),
              child: Column(
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
                      SearchIconwidget(data: controller.allTurf),
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
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GetBuilder<SearchPageController>(
                    builder: (controller) =>
                        SearchPage(data: searchPageController.foundTurf),
                  ),
                  CarouselSliderWidget(),
                  const SizedBox(height: 50),
                  const NearYouList(
                    heading: 'Near you',
                  ),
                  const SizedBox(height: 15),
                  const AllTurf(
                    heading: 'All Turf\'s',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
