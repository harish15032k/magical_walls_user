import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/presentation/widgets/common_search.dart';

import '../../../widgets/common_widgets.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isTermsAccepted = false;
  final TextEditingController address = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  bool filteropen = false;
  bool suffix = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset('assets/images/arrow-left.png', width: 25),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CommonSearch(
                        issuffixneed: suffix,
                        hintText: "E.g. AC Repair, Home Painting",
                        ontap: () {
                          setState(() {
                            filteropen = true;
                            suffix = true;
                          });
                        },
                        suffixontap: () {
                          setState(() {
                            suffix = false;
                            filteropen = false;
                          });
                        },
                      ),
                    ),
                    if (filteropen)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8, 2, 8),
                        child: GestureDetector(
                          onTap: () {
                            CommonWidgets.ShowBottomSheet(context);
                          },
                          child: Image.asset(
                            'assets/images/Vector.png',
                            width: 20,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: CommonWidgets.popularServices.length,
                    itemBuilder: (context, index) {
                      final data = CommonWidgets.popularServices[index];
                      return CommonWidgets.PopularBox(
                        isreviewneed: true,
                        image: data["image"]!,
                        title: data["title"]!,
                        price: data["price"]!,
                        rating: data["rating"]!,
                        reviews: data["reviews"]!,
                        batchImage: data['batchImage'],
                        batchColor: data['batchColor'],
                        batchName: data['batchName'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
