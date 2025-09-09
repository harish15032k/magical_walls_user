import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:magical_walls_user/core/constants/app_colors.dart';
import 'package:magical_walls_user/core/constants/app_text.dart';
import 'package:magical_walls_user/presentation/widgets/common_boxes.dart';
import '../../../widgets/common_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> ServiceList = [
    {'image': 'assets/images/service_man.png', 'name': 'Electrician'},
    {'image': 'assets/images/service_man.png', 'name': 'Plumbing'},
    {'image': 'assets/images/service_man.png', 'name': 'Painting'},
    {'image': 'assets/images/service_man.png', 'name': 'Electrician'},
  ];
  List<dynamic> BannerList = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: CommonTextStyles.regular16.copyWith(
                          color: CommonColors.secondary,
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Image.asset('assets/images/location.png', width: 20),
                          SizedBox(width: 5),
                          Text('KK Road', style: CommonTextStyles.regular18),
                          SizedBox(width: 5),
                          Transform.rotate(
                            angle: -90 * math.pi / 180,
                            child: Image.asset(
                              'assets/images/arrow-left.png',
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset('assets/images/notification.png', width: 25),
                ],
              ),
              SizedBox(height: 22),
              Text(
                'What service do you want?',
                style: CommonTextStyles.regular16,
              ),
              SizedBox(height: 12),
              CommonSearch(hintText: "E.g. AC Repair, Home Painting"),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Service Categories', style: CommonTextStyles.medium20),
                  Text(
                    'View All',
                    style: CommonTextStyles.regular16.copyWith(
                      color: CommonColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ServiceList.length,
                  itemBuilder: (context, index) {
                    final data = ServiceList[index];
                    return CommonWidgets.serviceBox(
                      image: data['image']!,
                      name: data['name']!,
                    );
                  },
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: BannerList.length,
                  itemBuilder: (context, index) {
                    final data = BannerList[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(data, fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 25),
              Text('Popular Services', style: CommonTextStyles.medium20),
              SizedBox(height: 15),
          SizedBox(
            height: 350,
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: CommonWidgets.popularServices.length,
              itemBuilder: (context, index) {
                final data = CommonWidgets.popularServices[index];
                return CommonWidgets.PopularBox(
                  image: data["image"]!,
                  title: data["title"]!,
                  price: data["price"]!,
                  rating: data["rating"]!,
                  reviews: data["reviews"]!,
                );
              },
            ),
          )
          
          ],
          ),
        ),
      ),
    );
  }
}
