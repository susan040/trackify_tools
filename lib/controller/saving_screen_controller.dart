import 'package:get/get.dart';

class SavingScreenController extends GetxController {
  var interestRate = "".obs;
  var period = "".obs; 
  var interestType = 'Annual'.obs;
  var periodType = 'Years'.obs;

  List<String> interestTypes = ['Annual', 'Monthly'];
  List<String> periodTypes = ['Years', 'Months'];

  void incrementRate() {
    interestRate.value = (double.parse(interestRate.value) + 0.5).toString();
  }

  void decrementRate() {
    interestRate.value = (double.parse(interestRate.value) - 0.5).toString();
  }

  void incrementPeriod() {
    period.value = (double.parse(interestRate.value) + 1).toString();
  }

  void decrementPeriod() {
    period.value = (double.parse(interestRate.value) - 1).toString();
  }

  void updateInterestRate(String value) {
    interestRate.value = value;
  }

  void updatePeriod(String value) {
    period.value = value; 
  }
}
