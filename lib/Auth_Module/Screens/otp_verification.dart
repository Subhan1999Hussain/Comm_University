import 'package:communiversity/Auth_Module/Controller/otp_verification_controller.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Widgets/custom_bottom_container.dart';
import 'package:communiversity/Widgets/custom_button.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:communiversity/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerification extends StatelessWidget {
  final OtpVerificationController otpController =
      Get.put(OtpVerificationController());
  OTPVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      leading: AssetPaths.BACK_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.OTP_VERIFICATION_MAIN_TEXT,
      headimagesList: [AssetPaths.BACKGROUND_OTP_IMAGE],
      bodyChild: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: screeen_padding.screenPadding),
          child: Form(
            key: otpController.otpFormkey,
            child: Column(children: [
              SizedBox(height: 10.h),
              //----------------OTP Field----------------
              pinCodeWidget(context),
              SizedBox(height: 15.h),
              //----------------Clock And Time----------------
              clockImageWidget(),
              timmerWidget(),
              SizedBox(height: 0.05.sh),
              //----------------Verify Button----------------
              verifyButtonWidget(),
              SizedBox(height: 0.05.sh),
              //----------------Bottom Area----------------
              didntReceiveCodeWidget(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget pinCodeWidget(BuildContext context) {
    return PinCodeTextField(
        appContext: context,
        length: 6,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.circle,
            fieldHeight: .13.sh,
            fieldWidth: .13.sw,
            activeFillColor: AppColors.SPLASH_COLOR,
            inactiveFillColor: AppColors.SPLASH_COLOR,
            selectedFillColor: AppColors.SPLASH_COLOR,
            activeColor: AppColors.SPLASH_COLOR,
            inactiveColor: AppColors.SPLASH_COLOR,
            selectedColor: AppColors.SPLASH_COLOR),
        showCursor: false,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        boxShadows: [
          BoxShadow(
              color: AppColors.SPLASH_COLOR.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 5,
              offset: const Offset(0, 2))
        ],
        onChanged: (value) {
          debugPrint(value);
        },
        controller: otpController.pinController,
        onSaved: (value) {
          otpController.pin = value!;
        },
        validator: (value) {
          return FieldValidator.validatePin(value!);
        });
  }

  Widget clockImageWidget() {
    return Image.asset(AssetPaths.CLOCK_ICON,
        color: AppColors.PRIMARY_COLOR, scale: 3.5.w);
  }

  Widget timmerWidget() {
    return GetBuilder<OtpVerificationController>(
        builder: (builder) => CustomText(
            maintext: '00 :${otpController.count} ',
            fontsize: 20.0.sp,
            is_alignLeft: false));
  }

  Widget verifyButtonWidget() {
    return CustomButton(
        text: AppStrings.VERIFY_BUTTON_TEXT,
        onclick: () {
          otpController.checkOtp();
        });
  }

  Widget didntReceiveCodeWidget() {
    return GetBuilder<OtpVerificationController>(
      builder: (builder) => CustomBottomContainer(
          starttext: AppStrings.DIDNT_RECEIVE_CODE_TEXT,
          endtext: AppStrings.RESEND_TEXT,
          onclick: () {
            if (otpController.count == 0) {
              otpController.reset();
            }
          }),
    );
  }
}
