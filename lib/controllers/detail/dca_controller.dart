part of '../controllers.dart';

class DCAController extends GetxController {
  int? userId;
  String? copyDataQRCode = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController empleyoIDController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  String? selectedStatus;
  ShiftData? selectedShift;

  String statusController = '';
  List<String> statusOption = ['Check In', 'Check Out'];
  List<ShiftData> shiftsData = [];

  void handleSelectedShift(ShiftData item) {
    selectedShift = item;
    update();
  }

  void handleSelectedStatus(String item) {
    selectedStatus = item;
    update();
  }

  void handleButtonStatus(String status) {
    selectedStatus = status;
    update();
  }

  Future<void> getShiftsData(BuildContext context) async {
    try {
      WrapResponse? resData = await Api().GET(API_SHIFT, context, useSnackbar: true);
      // print(resData?.toJson().toString());
      // print(resData?.message);
      // print(resData?.statusCode);
      // print(resData?.toJson().toString());
      if (resData?.data['data'] != null) {
        List<ShiftData> listShiftsData = [];
        for (var element1 in resData?.data['data']) {
          listShiftsData.add(ShiftData.fromJson(element1));
        }
        shiftsData = listShiftsData;
        update();
      }
    } catch (e) {
      log('Something wrong $e');
    }
  }

  Future<void> initPage(BuildContext context, String dataQRCode, String timeDateTakeQRCode) async {
    try {
      await getShiftsData(context);
      nameController.text = PRO(context).userData?.name ?? '';
      empleyoIDController.text = PRO(context).userData?.employeeId ?? '';
      divisionController.text = PRO(context).userData?.personGroup ?? '';
      timeController.text = timeDateTakeQRCode;
      userId = PRO(context).userData?.id;
      copyDataQRCode = dataQRCode;
    } catch (e) {
      snackBarsError(message: "Something Wrong");
    }
  }

  bool validation(BuildContext context) {
    if (userId.toString() == '' ||
        nameController.text == '' ||
        empleyoIDController.text == '' ||
        divisionController.text == '' ||
        copyDataQRCode == '' ||
        selectedShift?.name == '' ||
        selectedShift?.name == null ||
        timeController.text == '' ||
        selectedStatus == '' ||
        selectedStatus == null) {
      snackBars(message: 
        PRO(context).selectedCategory == "English" 
          ? "Please complete the form above" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Please complete the form above"
              : 'Tolong lengakapi Form data di atas'),
      );
      return false;
    }
    return true;
  }

  Future<void> submit(BuildContext context) async {
    if (validation(context) == false) {
      return;
    }
    AttendanceData data = AttendanceData(
      userId: userId.toString(),
      name: nameController.text,
      employeeId: empleyoIDController.text,
      division: divisionController.text,
      date: copyDataQRCode,
      shiftName: selectedShift?.name,
      // time: timeController.text,
      time: '00:00:00',
      terlambat: 0.toString(),
      status: selectedStatus,
    );
    log(data.toJsonSend().toString());
    WrapResponse? resData = await Api().POSTFORMDATA(API_ATTENDANCE_TAMBAH, data.toJsonSend(), context, useSnackbar: false, useToken: true);
    log(resData?.toJson().toString() ?? '');
    // print(resData?.message);
    // print(resData?.statusCode);
    // print(resData?.metaData?.toJson().toString());
    if (resData?.statusCode == 200) {
      snackBarsSuccess(message: "${resData?.metaData?.message}");
      Get.offAll(() => MainPage());
    } else {
      snackBarsError(message: "${resData?.metaData?.message}");
    }
  }
}
