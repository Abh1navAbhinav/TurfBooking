import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/home_controller.dart';
import 'package:ticket_booking/view/home_page/widgets/turfs_type_selection.dart';
import 'package:ticket_booking/view/turf_categories/turf_categories.dart';

class CarouselSliderWidget extends GetView<HomeController> {
  CarouselSliderWidget({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        CarouselSlider.builder(
          itemCount: controller.carouselItemImage.length,
          options: CarouselOptions(
            // autoPlayCurve: Curves.easeInOutQuad,
            autoPlay: true,
            aspectRatio: 9 / 4,
            autoPlayAnimationDuration: const Duration(milliseconds: 1500),
            autoPlayInterval: const Duration(milliseconds: 5000),
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            // initialPage: 1,
          ),
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: () {
                final image = controller.carouselItemImage[index];
                Get.to(
                  () => TurfCategories(
                    image: image,
                    index1: index,
                  ),
                );
              },
              child: TurfTypeSelection(
                index: index,
                image: AssetImage(
                  controller.carouselItemImage[index],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
