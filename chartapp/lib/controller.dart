
import 'package:chartapp/model.dart';
import 'package:get/get.dart';

enum Month {
  jan,
  feb,
  mar,
  apr,
  may,
  jun,
  jul,
  aug,
  sep,
  oct,
  nov,
  dec,
  notselected
}

class LinechartController extends GetxController {
  var activeMonth = Month.notselected.obs;

  // Sample data organized by month
  final Map<Month, List<Company>> monthData = {
    Month.mar: [
      Company(company: "Apple", type: "Entertainment"),
      Company(company: "Samsung", type: "Electronics"),
      Company(company: "Sony", type: "Entertainment")
    ],
    Month.jun: [
      Company(company: "Google", type: "Tech"),
      Company(company: "Microsoft", type: "Software"),
      Company(company: "Amazon", type: "E-commerce")
    ],
    Month.sep: [
      Company(company: "Tesla", type: "Automotive"),
      Company(company: "SpaceX", type: "Aerospace")
    ],
    Month.oct: [
      Company(company: "Netflix", type: "Streaming"),
      Company(company: "Hulu", type: "Streaming")
    ],
    Month.nov: [
      Company(company: "Nike", type: "Apparel"),
      Company(company: "Adidas", type: "Apparel")
    ],
  };

  // Function to get data for the active month
  List<Company> get activeMonthData => monthData[activeMonth.value] ?? [];
}
