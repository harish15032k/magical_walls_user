import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';
import 'package:magical_walls_user/presentation/widgets/common_button.dart';

import '../../../widgets/common_textfield.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

bool isTermsAccepted =false;
  final TextEditingController address = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      bottomNavigationBar:  Padding(
        padding: EdgeInsets.only(
          left: 18,
          right: 18,
          bottom: MediaQuery.of(context).viewInsets.bottom + 40,
        ),
        child: CommonButton(
          text: "Save Address",
          backgroundColor: CommonColors.primaryColor,
          textColor: CommonColors.white,

          onTap: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(

                children: [  GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(
                    'assets/images/arrow-left.png',
                    width: 25,
                  ),
                ),
                  const SizedBox(width: 8), Text("Add New Address", style: CommonTextStyles.medium20)],
              ),
              const SizedBox(height: 20),

              CommonTextField(
                controller: address,
                label: 'Full Address',
                hintText: 'Flat no., Street name, Area, Landmark',
                isRequired: true,
              ),

              SizedBox(height: Get.height * 0.020),
              CommonTextField(
                controller: city,
                label: 'City',
                hintText: 'Enter City Name',
                isRequired: true,
              ),

              SizedBox(height: Get.height * 0.020),

              CommonTextField(
                controller: pincode,
                keyboardType: TextInputType.emailAddress,
                label: 'Pincode',
                hintText: 'Enter 6-digit pincode',
                isRequired: true,
              ),


              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    side:  BorderSide(
                      color:CommonColors.grey ,
                      width: 1,
                    ),
                    hoverColor: CommonColors.primaryColor,
                    activeColor: CommonColors.primaryColor,
                    checkColor: CommonColors.white,
                    value: isTermsAccepted,
                    onChanged: (value) {
                      setState(() {
                        isTermsAccepted = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTermsAccepted = !isTermsAccepted;
                        });
                      },
                      child: Text(
                        "Make this my default address",
                        style: CommonTextStyles.regular16.copyWith(
                          color: CommonColors.black,

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}
