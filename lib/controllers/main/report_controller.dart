part of '../controllers.dart';

class ReportController extends GetxController {
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }

  List<HikData> hikData = [];

  Future<void> getHik(BuildContext context, int selectedMonth, int selectedYear) async {
    try {
      handleLoadingWidget();
      String selectedMonthString = selectedMonth.toString();
      if (selectedMonth.toString().length == 1) {
        selectedMonthString = '0$selectedMonth';
      }
      print('$API_HIK?tgl=$selectedYear-$selectedMonthString');

      WrapResponse? resData = await Api().GET('$API_HIK?tgl=$selectedYear-$selectedMonthString', context, useSnackbar: false, useToken: true, useLoading: false);
      log(resData?.statusCode.toString() ?? '');
      if (resData?.statusCode == 200) {
        log(resData?.data['data'].toString() ?? '');
        if (resData?.data['data'] != null) {
          List<HikData> listHikData = [];
          for (var element1 in resData?.data['data']) {
            listHikData.add(HikData.fromJson(element1));
          }
          listHikData.sort((a, b) => (b.idHik ?? 0).compareTo(a.idHik ?? 0));
          hikData = listHikData;
          update();
        }
        handleLoadingWidget();
        // snackBarsSuccess(message: "${resData?.metaData?.message ?? 'Berhasil'}");
      } else {
        handleLoadingWidget();
        // snackBarsError(message: "${resData?.metaData?.message ?? 'Gagal'}");
      }
    } catch (e) {
      // snackBarsError(message: 'Something wrong $e');
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
      await getHik(context, selectedMonth, selectedYear);
    }
  }

  Future<void> initPage(BuildContext context) async {
    if (selectedMonthGlobal == null && selectedYearGlobal == null) {
      int selectedMonth = DateTime.parse(now.toString()).month;
      int selectedYear = DateTime.parse(now.toString()).year;
      await getHik(context, selectedMonth, selectedYear);
    } else {
      await getHik(context, selectedMonthGlobal!, selectedYearGlobal!);
    }
  }
}
