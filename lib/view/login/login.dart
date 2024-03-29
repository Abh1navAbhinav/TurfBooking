import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/controller/login_controller.dart';
import 'package:ticket_booking/global_constants/constants.dart';
import 'package:ticket_booking/view/login/widgets/create_new_account.dart';
import 'package:ticket_booking/view/login/widgets/createnewaccount.dart';
import 'package:ticket_booking/view/login/widgets/login_account.dart';
import 'package:ticket_booking/view/login/widgets/login_button.dart';
import 'package:ticket_booking/view/login/widgets/login_text.dart';
import 'package:ticket_booking/view/login/widgets/otp_registration.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: constantObj.gradientColors(),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 244, 246),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  Obx(
                    () => AnimatedCrossFade(
                      firstChild: !controller.isOTpRegistration.value
                          ? const LoginText(
                              text1: 'OTP Re',
                              text2: 'g',
                              text3: 'istration',
                              fontSize: 40,
                            )
                          : const LoginText(
                              text1: 'Si',
                              text2: 'g',
                              text3: 'n up',
                              fontSize: 50,
                            ),
                      secondChild: const LoginText(
                        text1: 'Lo',
                        text2: 'g',
                        text3: 'in',
                        fontSize: 70,
                      ),
                      crossFadeState: controller.isCreatedNewAccount.value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 200),
                      firstCurve: Curves.decelerate,
                      secondCurve: Curves.easeInOutQuart,
                    ),
                  ),
                  Obx(
                    () => AnimatedCrossFade(
                      firstChild: !controller.isOTpRegistration.value
                          ? const OtpRegistration()
                          : const CreateNewAccount(),
                      secondChild: const LoginAccount(),
                      crossFadeState: controller.isCreatedNewAccount.value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 700),
                      firstCurve: Curves.easeInOutCubicEmphasized,
                      secondCurve: Curves.easeInOutQuart,
                    ),
                  ),
                  Obx(
                    () => controller.isCreatedNewAccount.value
                        ? const SizedBox(
                            height: 50,
                          )
                        : const SizedBox(),
                  ),
                  const LoginButton(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 5,
                  ),
                  Obx(
                    () => controller.isOTpRegistration.value
                        ? AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            child: Column(
                              children: [
                                /*  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(seconds: 2),
                                      width: !controller.isDividerSize.value
                                          ? 0
                                          : MediaQuery.of(context).size.width /
                                              3,
                                      child: const Divider(
                                        thickness: 1,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    Text(
                                      '   or   ',
                                      style: constantObj.ktextStyle,
                                    ),
                                    AnimatedContainer(
                                      duration: const Duration(seconds: 2),
                                      width: !controller.isDividerSize.value
                                          ? 0
                                          : MediaQuery.of(context).size.width /
                                              3,
                                      child: const Divider(
                                        thickness: 1,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ), */
                                const SizedBox(
                                  height: 100,
                                ),
                                /*    Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    SocialMediaIcon(
                                        image: 'assets/icons/facebook.png'),
                                    SocialMediaIcon(
                                        image: 'assets/icons/google.png'),
                                    SocialMediaIcon(
                                        image: 'assets/icons/twitter.png'),
                                  ],
                                ), */
                                // const SizedBox(
                                //   height: 80,
                                // ),
                                Obx(
                                  () => !controller.isCreatedNewAccount.value
                                      ? const CreateNewAccountText(
                                          firstText: 'Don\'t have an account? ',
                                          secondText: ' Sign UP',
                                        )
                                      : const CreateNewAccountText(
                                          firstText:
                                              'Already have an account? ',
                                          secondText: ' Login',
                                        ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
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
