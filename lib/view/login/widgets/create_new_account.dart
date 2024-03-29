import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/login_controller.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/view/login/widgets/login_text_form_field.dart';

class CreateNewAccount extends GetView<LoginController> {
  const CreateNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: controller.signupFormkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LoginTextFormField(
                    focusNode: controller.eMailTextfieldFocusNode,
                    isTextFieldClicked: controller.isTextFieldClicked3,
                    textEditingController: controller.signUpEmailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    containerColor: constantObj.kColor30,
                    textColor: const Color.fromARGB(255, 242, 244, 246),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }

                      if (value.contains(' ')) {
                        return 'Remove all whiteSpaces';
                      }
                      if (!controller.emailValid.hasMatch(value)) {
                        return 'Email is not valid';
                      }

                      return null;
                    },
                  ),
                  // LoginTextFormField(
                  //   isTextFieldClicked: controller.isTextFieldClicked4,
                  //   focusNode: controller.mobileTextfieldFocusNode,
                  //   textEditingController: controller.signUPMobileController,
                  //   hintText: 'Mobile number',
                  //   keyboardType: TextInputType.phone,
                  //   textInputFormatter: [
                  //     FilteringTextInputFormatter.digitsOnly
                  //   ],
                  //   obscureText: false,
                  //   containerColor: constantObj.kColor30,
                  //   textColor: const Color.fromARGB(255, 242, 244, 246),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Mobile is required';
                  //     }
                  //     if (value.length != 10) {
                  //       return 'Moblie is not valid';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  Obx(
                    () => LoginTextFormField(
                      isTextFieldClicked: controller.isTextFieldClicked5,
                      textEditingController:
                          controller.signUpPasswordController,
                      hintText: 'New Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !controller.isPasswordVisibleSignin.value,
                      containerColor: constantObj.kColor30,
                      textColor: const Color.fromARGB(255, 242, 244, 246),
                      isPasswordField: IconButton(
                        onPressed: () {
                          controller.isPasswordVisibleSignin.value =
                              !controller.isPasswordVisibleSignin.value;
                        },
                        icon: Icon(
                          controller.isPasswordVisibleSignin.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: controller.isPasswordVisibleSignin.value
                              ? Colors.black54
                              : Colors.black38,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (!controller.passwordValid.hasMatch(value)) {
                          return 'Please enter a strong password';
                        }
                        return null;
                      },
                    ),
                  ),
                  LoginTextFormField(
                    isTextFieldClicked: controller.isTextFieldClicked6,
                    textEditingController: controller.signUpConfirmController,
                    hintText: 'Confirm Password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    containerColor: constantObj.kColor30,
                    textColor: const Color.fromARGB(255, 242, 244, 246),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm password is required';
                      }
                      if (value != controller.signUpPasswordController.text) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
