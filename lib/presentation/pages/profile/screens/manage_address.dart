import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';
import 'package:magical_walls_user/presentation/pages/profile/screens/add_address.dart';
import 'package:magical_walls_user/presentation/widgets/common_button.dart';

import '../../../widgets/common_textfield.dart';

class ManageAddress extends StatefulWidget {
  const ManageAddress({super.key});

  @override
  State<ManageAddress> createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  bool isTermsAccepted = false;
  final TextEditingController address = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      'assets/images/arrow-left.png',
                      width: 25,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text("Manage Address", style: CommonTextStyles.medium20),
                ],
              ),
              const SizedBox(height: 20),
              Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    padding: const EdgeInsets.fromLTRB(12,12,12,12),
    decoration: BoxDecoration(
    color: CommonColors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: CommonColors.textFieldGrey,width: 1.5),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Flat 202,  Lotus Apartments,\nChennai - 600028',
                      style: CommonTextStyles.regular16,
                    ),
Row(children: [  Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 6,
  ),
  decoration: BoxDecoration(
    color: CommonColors.blue.withAlpha(30),
    borderRadius: BorderRadius.circular(30),
  ),
  child: Text(
    'Default',
    style: CommonTextStyles.medium14.copyWith(
      color:CommonColors.blue,
    ),
  ),
),SizedBox(width: 12,),InkWell( onTap: (){
  Get.to(() => AddAddress(page:'edit'),
      transition: Transition.rightToLeft);
}, child: Image.asset('assets/images/edit-2.png',width: 20,))],)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CommonButton(text: 'Add New Address',borderColor: CommonColors.purple,textColor: CommonColors.purple,onTap: (){
                Get.to(() => AddAddress(page:'add'),
                    transition: Transition.rightToLeft);
              },)
            ],
          ),
        ),
      ),
    );
  }
}
