import 'package:flutter/material.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';

import 'common_button.dart';

class CommonBox extends StatelessWidget {
  final String? tab;
  final String jobId;
  final String jobType;
  final String customerName;
  final String date;
  final String timeSlot;
  final String address;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;
  final VoidCallback? ontap;

  const CommonBox({
    super.key,
    required this.jobId,
    required this.jobType,
    required this.customerName,
    required this.date,
    required this.timeSlot,
    required this.address,
    this.onAccept,
    this.onReject,
    this.ontap,
    this.tab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CommonColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CommonColors.textFieldGrey, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            subtitle: Text(
              '₹1499',
              style: CommonTextStyles.regular18.copyWith(
                color: CommonColors.primaryColor,
              ),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: tab == 'upcoming'
                    ? CommonColors.blue.withAlpha(30)
                    : tab == 'completed'
                    ? CommonColors.green.withAlpha(30)
                    : CommonColors.red.withAlpha(30),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 2,
                ),
                child: Text(
                  tab == 'upcoming'
                      ? 'Confirmed'
                      : tab == 'completed'
                      ? 'Completed'
                      : 'Cancelled',
                  style: CommonTextStyles.medium12.copyWith(
                    color: tab == 'upcoming'
                        ? CommonColors.blue
                        : tab == 'completed'
                        ? CommonColors.green
                        : CommonColors.red,
                  ),
                ),
              ),
            ),
            leading: Container(
              width: 73,
              height: 49,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ac.png'),
                ),
              ),
            ),
            title: Text(
              jobType,
              style: CommonTextStyles.medium18.copyWith(
                color: CommonColors.black,
              ),
            ),
          ),

          const SizedBox(height: 5),
          Text(
            jobType,
            style: CommonTextStyles.medium18.copyWith(
              color: CommonColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date & Time',
                    style: CommonTextStyles.regular14.copyWith(
                      color: CommonColors.secondary,
                    ),
                  ),
                  Text(date, style: CommonTextStyles.medium14),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),

          const SizedBox(height: 8),
          Text(
            'Address',
            style: CommonTextStyles.regular14.copyWith(
              color: CommonColors.secondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(address, style: CommonTextStyles.medium14),
          const SizedBox(height: 12),
          if (tab == 'cancelled')
            Text(
              'Reason for Cancel',
              style: CommonTextStyles.regular14.copyWith(
                color: CommonColors.secondary,
              ),
            ),
          if (tab == 'cancelled') const SizedBox(height: 4),
          if (tab == 'cancelled')
            Text(
              "Due to a change in our personal schedule, we are unable to proceed with the full home painting at this time.",
              style: CommonTextStyles.medium14,
            ),
          if (tab == 'cancelled') const SizedBox(height: 12),
          if (tab == 'upcoming' || tab == 'completed')
            CommonButton(
              onTap: ontap,
              borderColor: CommonColors.purple,
              textColor: CommonColors.purple,
              text: tab == 'upcoming' ? "Cancel Booking" : "Rate & Review",
            ),
        ],
      ),
    );
  }
}
