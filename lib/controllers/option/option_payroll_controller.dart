part of '../controllers.dart';

class OptionPayrollController extends GetxController {
  List<PayrollData> payrollData = [];

  Future<void> getPayroll(BuildContext context, int selectedMonth, int selectedYear) async {
    try {
      String selectedMonthString = selectedMonth.toString();
      if (selectedMonth.toString().length == 1) {
        selectedMonthString = '0$selectedMonth';
      }
      print('$payrollAPI?date=$selectedYear-$selectedMonthString');

      WrapResponse? resData = await Api().GET('$payrollAPI?date=$selectedYear-$selectedMonthString', context, useSnackbar: false, useToken: true, useLoading: false);
      log(resData?.statusCode.toString() ?? '');
      if (resData?.statusCode == 200) {
        log(resData?.data['data'].toString() ?? '');
        if (resData?.data['data'] != null) {
          List<PayrollData> listPayrollData = [];
          for (var element1 in resData?.data['data']) {
            listPayrollData.add(PayrollData.fromJson(element1));
          }
          payrollData = listPayrollData;
          print(payrollData.map((data) => data.toJson()).toList());
          update();
        }
        snackBarsSuccess(message: 
          PRO(context).selectedCategory == "English" 
          ? "Payroll Slip Successfully Loaded" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Payroll Slip Successfully Loaded"
              : 'Slip Gaji Berhasil Dimuat'),
        );
      } else {
        snackBarsError(message: 
          PRO(context).selectedCategory == "English" 
          ? "Payroll Slip Failed to Load" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Payroll Slip Failed to Load"
              : 'Slip Gaji Gagal Dimuat'),
        );
      }
    } catch (e) {
      snackBarsError(message: 'Something wrong $e');
    }
  }

  // handle Date
  DateTime now = DateTime.now();

  DateTime? selectedDate;
  int? selectedMonthGlobal;
  int? selectedYearGlobal;
  bool showModal = false;
  DateRangePickerView selectMode = DateRangePickerView.year;

  ScrollController controllerDataCheckInOut = ScrollController();

  void handleShowModal() {
    showModal = true;
    update();
  }

  Future<void> handleSelectDate(DateRangePickerViewChangedArgs args, context) async {
    if (args.view == DateRangePickerView.month) {
      DateTime? selectedDateTime = args.visibleDateRange.startDate;
      selectedDate = args.visibleDateRange.startDate;
      selectMode = DateRangePickerView.year;
      int selectedMonth = DateTime.parse(selectedDateTime.toString()).month;
      int selectedYear = DateTime.parse(selectedDateTime.toString()).year;
      selectedMonthGlobal = selectedMonth;
      selectedYearGlobal = selectedYear;
      showModal = false;
      update();
      await getPayroll(context, selectedMonth, selectedYear);
    }
  }

  Future<void> initPage(BuildContext context) async {
    if (selectedMonthGlobal == null && selectedYearGlobal == null) {
      int selectedMonth = DateTime.parse(now.toString()).month;
      int selectedYear = DateTime.parse(now.toString()).year;
      await getPayroll(context, selectedMonth, selectedYear);
    } else {
      await getPayroll(context, selectedMonthGlobal!, selectedYearGlobal!);
    }
  }
}
