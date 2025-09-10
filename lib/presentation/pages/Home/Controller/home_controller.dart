import 'package:get/get.dart';

class HomeController extends GetxController {
 static HomeController get to => Get.put(HomeController(), permanent: true);

 var selectedPriceFilter = ''.obs;
 var selectedRatingFilter = ''.obs;
 var selectedPopularityFilter = ''.obs;


 void toggleFilter(String label, String section) {
  if (section == 'price') {
   if (selectedPriceFilter.value == label) {
    selectedPriceFilter.value = '';
   } else {
    selectedPriceFilter.value = label;
   }
  } else if (section == 'rating') {
   if (selectedRatingFilter.value == label) {
    selectedRatingFilter.value = '';
   } else {
    selectedRatingFilter.value = label;
   }
  } else if (section == 'popularity') {
   if (selectedPopularityFilter.value == label) {
    selectedPopularityFilter.value = '';
   } else {
    selectedPopularityFilter.value = label;
   }
  }
 }

 bool isSelected(String label, String section) {
  if (section == 'price') {
   return selectedPriceFilter.value == label;
  } else if (section == 'rating') {
   return selectedRatingFilter.value == label;
  } else if (section == 'popularity') {
   return selectedPopularityFilter.value == label;
  }
  return false;
 }


 void resetSection(String section) {
  if (section == 'price') {
   selectedPriceFilter.value = '';
  } else if (section == 'rating') {
   selectedRatingFilter.value = '';
  } else if (section == 'popularity') {
   selectedPopularityFilter.value = '';
  }
 }


 void resetAllFilters() {
  selectedPriceFilter.value = '';
  selectedRatingFilter.value = '';
  selectedPopularityFilter.value = '';
 }
}