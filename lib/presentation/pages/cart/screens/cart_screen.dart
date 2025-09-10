import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/presentation/widgets/common_textfield.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_widgets.dart';
import '../../profile/screens/add_address.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final List<String> dates;
  @override
  void initState() {
    super.initState();
    dates = _generateNext30Days();
  }
  int selectedDateIndex = 0;
  int selectedSlotIndex = 0;
  int selectedTimeIndex = -1;
  int selectedTab = 0;
  int selectedMorningIndex = -1;
  int selectedAfternoonIndex = -1;
  int selectedEveningIndex = -1;

  List<String> _generateNext30Days() {
    final now = DateTime.now();
    return List.generate(30, (index) {
      final date = now.add(Duration(days: index));
      final weekday = _getWeekday(date.weekday);
      print("weekday ${weekday}");
      return "$weekday\n  ${date.day}";
    });
  }

  String _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "";
    }
  }

  final List<String> timeSlots = [
    "08:00 AM",
    "08:30 AM",
    "09:00 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
  ];

  final List<String> timeSlotsAfternoon = [
    "12:00 PM",
    "12:30 PM",
    "01:00 PM",
    "01:30 PM",
    "02:00 PM",
    "02:30 PM",
    "03:00 PM",
  ];

  final List<String> timeSlotsEvening = [
    "04:00 PM",
    "04:30 PM",
    "05:00 PM",
    "05:30 PM",
    "06:00 PM",
    "06:30 PM",
    "07:00 PM",
    "07:30 PM",
  ];

  Widget _buildJobList(String tab) {
    final slots = tab == "Morning"
        ? timeSlots
        : tab == "Afternoon"
        ? timeSlotsAfternoon
        : timeSlotsEvening;

    return Wrap(
      spacing: 8,
      runSpacing: 14,
      children: List.generate(slots.length, (index) {
        bool isSelected = (tab == "Morning" && selectedMorningIndex == index) ||
            (tab == "Afternoon" && selectedAfternoonIndex == index) ||
            (tab == "Evening" && selectedEveningIndex == index);

        return GestureDetector(
          onTap: () {
            setState(() {
              if (tab == "Morning") {
                selectedMorningIndex = index;
              } else if (tab == "Afternoon") {
                selectedAfternoonIndex = index;
              } else {
                selectedEveningIndex = index;
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? CommonColors.primaryColor : CommonColors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: CommonColors.textFieldGrey),
            ),
            child: Text(
              slots[index],
              style: CommonTextStyles.regular14.copyWith(
                color: isSelected ? CommonColors.white : CommonColors.black,
              ),
            ),
          ),
        );
      }),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          children: [

            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset('assets/images/arrow-left.png', width: 25),
                ),
                const SizedBox(width: 8),
                Text("Cart", style: CommonTextStyles.medium20),
              ],
            ),
            const SizedBox(height: 16),

            ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: CommonWidgets.popularServices.length,
              itemBuilder: (context, index) {
                final data = CommonWidgets.popularServices[index];
                return GestureDetector(
                  child: CommonWidgets.PopularBox(
                    image: data["image"]!,
                    title: data["title"]!,
                    price: data["price"]!,
                    rating: data["rating"]!,
                    reviews: data["reviews"]!,
                    isreviewneed: false,
                    showAddButton: true,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text("Saved Address", style: CommonTextStyles.semiBold16),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Radio(
                  value: true,
                  groupValue: true,
                  onChanged: (val) {},
                  activeColor: CommonColors.primaryColor,
                ),
                Expanded(
                  child: Text(
                    "Flat 202, Lotus Apartments,\nChennai - 600028",
                    style: CommonTextStyles.regular14.copyWith(
                      color: CommonColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {Get.to(()=> AddAddress(),transition: Transition.rightToLeft);},
              child: Text(
                "Add New Address",
                style: CommonTextStyles.semiBold14.copyWith(
                  color: CommonColors.primaryColor,
                ),
              ),
            ),


            const SizedBox(height: 18),
            Text("Select Date", style: CommonTextStyles.semiBold16),
            const SizedBox(height: 8),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedDateIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedDateIndex = index),
                    child: Container(
                      width: 50,
                      margin: const EdgeInsets.only(right: 8),

                      decoration: BoxDecoration(
                        color: isSelected
                            ? CommonColors.primaryColor.withAlpha(30)
                            : CommonColors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color:isSelected?CommonColors.primaryColor: Colors.transparent),
                      ),
                      child: Center(
                        child: Text(
                          dates[index],
                          style: CommonTextStyles.semiBold14.copyWith(
                            color:
                                 CommonColors.secondary

                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// Time Selector
            const SizedBox(height: 16),
            Text("Select Scheduled Time", style: CommonTextStyles.semiBold16),
            const SizedBox(height: 10),
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
                  _buildTimeTab("Morning", 0),
                  _buildTimeTab("Afternoon", 1),
                  _buildTimeTab("Evening", 2),
                ],
              ),
            ),
            const SizedBox(height: 15),
            IndexedStack(
              index: selectedTab,
              children: [
                _buildJobList("Morning"),
                _buildJobList("Afternoon"),
                _buildJobList("Evening"),
              ],
            ),




            const SizedBox(height: 20),
            Text("Apply Coupon", style: CommonTextStyles.semiBold16),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child:CommonTextField( islableneed: false, hintText: 'Enter Promo Code')
                ),
                const SizedBox(width: 8),
                CommonButton(
                  text: "Apply",
                  backgroundColor: CommonColors.primaryColor,
                  textColor: CommonColors.white,
                  onTap: () {},
                  width: 90,
                  height: 50,
                ),
              ],
            ),

            /// Price Breakdown
            const SizedBox(height: 16),
            Text("Price Breakdown", style: CommonTextStyles.semiBold16),
            const SizedBox(height: 6),
            _buildPriceRow("Service Total", "₹1499"),
            _buildPriceRow("Discount", "-"),
            _buildPriceRow("Taxes", "₹234"),

            _buildPriceRow("Total Payable", "₹1533",),

          ],
        ),
      ),


      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CommonButton(
          text: "Proceed to Pay",
          backgroundColor: CommonColors.primaryColor,
          textColor: CommonColors.white,
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildTimeTab(String title, int index) {
    final isSelected = selectedSlotIndex == index;
    return GestureDetector(
      onTap: () => setState(() {
        selectedSlotIndex = index;
        selectedTab = index;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? CommonColors.primaryColor.withAlpha(30)
              : CommonColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? CommonColors.primaryColor
                : CommonColors.textFieldGrey,
          ),
        ),
        child: Text(
          title,
          style: CommonTextStyles.regular14.copyWith(
            color: isSelected ? CommonColors.primaryColor : CommonColors.black,
          ),
        ),
      ),
    );
  }


  Widget _buildPriceRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isBold
                ? CommonTextStyles.semiBold16
                : CommonTextStyles.regular14.copyWith(
                    color: CommonColors.secondary,
                  ),
          ),
          Text(
            value,
            style: isBold
                ? CommonTextStyles.semiBold18.copyWith(
                    color: CommonColors.primaryColor,
                  )
                : CommonTextStyles.regular16,
          ),
        ],
      ),
    );
  }
}
