import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_widgets.dart';

class JobDetailsScreen extends StatefulWidget {
  final Map<String, String?> job;
  final String tab;
  late bool isaccept;

  JobDetailsScreen({
    super.key,
    required this.job,
    this.isaccept = false,
    required this.tab,
  });

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: SingleChildScrollView(
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
                    Text(
                      'Job Detail',
                      style: CommonTextStyles.medium20.copyWith(
                        color: CommonColors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: CommonColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: CommonColors.textFieldGrey,
                      width: 1,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Booking Information',
                              style: CommonTextStyles.medium16,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: widget.tab == 'upcoming'
                                    ? CommonColors.blue.withAlpha(30)
                                    : widget.tab == 'completed'
                                    ? CommonColors.green.withAlpha(30)
                                    : CommonColors.red.withAlpha(30),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                widget.tab == 'upcoming'
                                    ? 'Confirmed'
                                    : widget.tab == 'completed'
                                    ? 'Completed'
                                    : 'Cancelled',
                                style: CommonTextStyles.medium12.copyWith(
                                  color: widget.tab == 'upcoming'
                                      ? CommonColors.blue
                                      : widget.tab == 'completed'
                                      ? CommonColors.green
                                      : CommonColors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _twoColumnRow(
                          'Service Type:',
                          'AC Repair - Gas Refill',
                          'Booking ID:',
                          '#BK234523',
                        ),
                        const SizedBox(height: 12),
                        _twoColumnRow(
                          'Date:',
                          '25 July 2025',
                          'Time Slot:',
                          '10 AM - 12 PM',
                        ),
                        const SizedBox(height: 12),
                        if (widget.tab == 'completed')
                          _twoColumnRow(
                            'Completed On:',
                            '26 July 2025 - 03:45 PM',
                            '',
                            '',
                          ),

                        const SizedBox(height: 16),
                        Divider(color: CommonColors.textFieldGrey),

                        Text('Payment Info', style: CommonTextStyles.medium16),
                        const SizedBox(height: 12),
                        _twoColumnRow(
                          'Amount:',
                          '₹1200',
                          'Payment Mode:',
                          'UPI',
                        ),
                        const SizedBox(height: 12),
                        _twoColumnRow('', '', 'Payment Status:', 'Paid'),

                        const SizedBox(height: 16),
                        Divider(color: CommonColors.textFieldGrey),

                        Text(
                          'Technician Notes',
                          style: CommonTextStyles.medium16,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Gas refill for split AC\nReplaced low gas and tested cooling. Customer satisfied',
                          style: CommonTextStyles.regular16.copyWith(
                            color: CommonColors.black,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '• Inspect the AC Unit',
                              style: CommonTextStyles.regular14,
                            ),
                            SizedBox(height: 6),
                            Text(
                              '• Identify Gas Leakage',
                              style: CommonTextStyles.regular14,
                            ),
                            SizedBox(height: 6),
                            Text(
                              '• Refill Gas Cylinder',
                              style: CommonTextStyles.regular14,
                            ),
                            SizedBox(height: 6),
                            Text(
                              '• Test Cooling',
                              style: CommonTextStyles.regular14,
                            ),
                            SizedBox(height: 6),
                            Text(
                              '• Customer Approval',
                              style: CommonTextStyles.regular14,
                            ),
                            SizedBox(height: 6),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Image.asset('assets/images/ac.png', width: 150),

                        const SizedBox(height: 24),
                        if (widget.tab != 'cancelled')
                          CommonButton(
                            borderColor: CommonColors.purple,
                            textColor: CommonColors.purple,
                            text: widget.tab == 'upcoming'
                                ? 'Cancel Booking'
                                : 'Rate & Review',
                            onTap: () {
                              widget.tab == 'upcoming'
                                  ? CommonWidgets.showCancelPopup(context)
                                  : CommonWidgets.showRatePopup(context);
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _twoColumnRow(
    String leftLabel,
    String leftValue,
    String rightLabel,
    String rightValue,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leftLabel,
                style: CommonTextStyles.regular14.copyWith(
                  color: CommonColors.secondary,
                ),
              ),
              const SizedBox(height: 2),
              SizedBox(
                width: 120,
                child: Text(leftValue, style: CommonTextStyles.medium14),
              ),
            ],
          ),
        ),
        SizedBox(width: 100),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (rightLabel.isNotEmpty) ...[
                Text(
                  rightLabel,
                  style: CommonTextStyles.regular14.copyWith(
                    color: CommonColors.secondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(rightValue, style: CommonTextStyles.medium14),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
