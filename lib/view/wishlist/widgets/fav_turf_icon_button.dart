import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/wishlist_controller.dart';
import 'package:ticket_booking/model/home/all_turf/datum.dart';

class FavTurfIconButton extends GetView<WishListController> {
  const FavTurfIconButton({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Datum data;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.checkFavAndAddToDb(data);
      },
      icon: GetBuilder<WishListController>(
        builder: (controller) => Icon(
          controller.isFav(data) ? Icons.bookmark : Icons.bookmark_outline,
        ),
      ),
      color: controller.isFav(data) ? Colors.greenAccent : Colors.greenAccent,
    );
  }
}
