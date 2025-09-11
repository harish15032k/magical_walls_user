import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';
import 'package:magical_walls_user/presentation/widgets/common_button.dart';
import 'package:magical_walls_user/presentation/widgets/common_widgets.dart';

import '../../../widgets/common_box.dart';
import '../../../widgets/common_textfield.dart';
import 'order_viewdetails.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {

  int selectedTab = 0;

  final List<Map<String, String?>> jobs = [
    {
      'id': 'BK234523',
      'type': 'AC Repair - Gas Refill',
      'customer': 'Ravi Kumar',
      'date': '25 July 2025',
      'timeSlot': '10 AM - 12 PM',
      'address': 'Flat 202, Lotus Apartments, Salem',
    },
  ];

  Widget _buildJobList(String tab) {
    if (jobs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/review_icon.png',
              width: 100,
            ),
            const SizedBox(height: 16),
            Text(
              'No Bookings yet',
              style: CommonTextStyles.medium20.copyWith(
                color: CommonColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'You’ll see your accepted jobs here.\nHang tight—we’ll notify you when something comes up.',
              style: CommonTextStyles.regular14.copyWith(
                color: CommonColors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        return GestureDetector(
          onTap: () {
            Get.to(()=>JobDetailsScreen(job:job,tab:tab),transition: Transition.zoom);
          },
          child: CommonBox(
            ontap: (){
           tab=='upcoming'? CommonWidgets.showCancelPopup(context): CommonWidgets.showRatePopup(context);
            },
            tab: tab,

            jobId: job['id'] ?? '',
            jobType: job['type'] ?? '',
            customerName: job['customer'] ?? '',
            date: job['date'] ?? '',
            timeSlot: job['timeSlot'] ?? '',
            address: job['address'] ?? '',

          ),
        );
      },
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: isSelected ? CommonColors.primaryColor.withAlpha(25) : CommonColors.white,
            borderRadius: BorderRadius.circular(6)
        ),
        child: Text(
          title,
          style: CommonTextStyles.regular16.copyWith(
            color: isSelected ? CommonColors.primaryColor : CommonColors.black,
          ),
        ),
      ),
    );
  }

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
              Text("My Bookings", style: CommonTextStyles.medium20),
              const SizedBox(height: 16),

               Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.fromLTRB(12,6,12,6),
                  decoration: BoxDecoration(
                    color: CommonColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: CommonColors.textFieldGrey,width: 1.5),

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTab("Upcoming", 0),
                      const SizedBox(width: 12),
                      _buildTab("Completed", 1),
                      const SizedBox(width: 12),
                      _buildTab("Cancelled", 2),
                    ],
                  ),
                ),

              Expanded(
                child: IndexedStack(
                  index: selectedTab,
                  children: [
                    _buildJobList("upcoming"),
                    _buildJobList("completed"),
                    _buildJobList("cancelled"),
                  ],
                ),
              ),
              const SizedBox(height: 24),


              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

}
