import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/login_controller.dart';
import 'package:ticket_booking/global_constants/constants.dart';

class ForgotAccountButton extends GetView<LoginController> {
  const ForgotAccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot password?',
            style: constantObj.ktextStyle,
          ),
        ),
      ],
    );
  }
}
