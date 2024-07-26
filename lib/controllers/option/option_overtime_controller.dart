part of '../controllers.dart';

class OptionOvertimeController extends GetxController {
  TextEditingController controllerUserID = TextEditingController();
  TextEditingController controllerEmpoyeeID = TextEditingController();
  TextEditingController controllerDivisi = TextEditingController();
  TextEditingController controllerGaji = TextEditingController();
  TextEditingController controllerJamMasuk = TextEditingController();
  TextEditingController controllerJamPulang = TextEditingController();

  //
  bool conditionGetAPI = false;
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }

  // modal Date
  bool showModal = false;
  String selectedDate = '';
  TextEditingController controllerTanggal = TextEditingController();
  DateRangePickerController controllerDatePicker = DateRangePickerController();

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      selectedDate = args.value.toString();
      controllerTanggal.text = args.value.toString().split(' ')[0];
      showModal = false;
      update();
    }
  }

  void handleShowModal() {
    showModal = true;
    update();
  }
  // end modal Date

  // list category
  String selectedCategory = 'Hari Kerja';
  List<String> category = ['Hari Kerja', 'Hari Libur'];

  void handleSelectedCategory(dynamic itemSelected) {
    selectedCategory = itemSelected;
    update();
  }

bool validation(BuildContext context) {
    if (controllerUserID.text == '' ||
        controllerEmpoyeeID.text == '' ||
        controllerDivisi.text == '' ||
        controllerGaji.text == '' ||
        controllerTanggal.text == '' ||
        controllerJamMasuk.text == '' ||
        controllerJamPulang.text == '' ||
        selectedCategory == '') {
      snackBars(message: 
        PRO(context).selectedCategory == "English" 
          ? "Please complete the form above" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Please complete the form above"
              : 'Tolong lengkapi form di atas'),  
      );
      return false;
    }
    return true;
  }

  // submit
  Future<void> submit(BuildContext context) async {
    bool conditionJamMasuk = isValidTime(controllerJamMasuk.text);
    if (conditionJamMasuk == false) {
      snackBars(message: 
        PRO(context).selectedCategory == "English" 
          ? "Please enter the Clock In time correctly, such as 08:00:00" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Please enter the Clock In time correctly, such as 08:00:00"
              : 'Harap memasukkan jam masuk dengan benar, seperti 08:00:00'),
      );
      return;
    }
    bool conditionJamPulang = isValidTime(controllerJamPulang.text);
    if (conditionJamPulang == false) {
      snackBars(message: 
        PRO(context).selectedCategory == "English" 
          ? "Please enter the Clock Out time correctly, such as 16:00:00" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Please enter the Clock Out time correctly, such as 16:00:00"
              : 'Harap memasukkan jam pulang dengan benar, seperti 16:00:00'),
      );
      return;
    }
    if (validation(context) == false) {
      return;
    }
    handleLoadingWidget();
    EmpovertimeData data = EmpovertimeData(
        employeeId: controllerEmpoyeeID.text.toString(), 
        userId: controllerUserID.text.toString(), 
        // userId: int.tryParse(controllerUserID.text),
        date: controllerTanggal.text, 
        timeMasuk: controllerJamMasuk.text, 
        timePulang: controllerJamPulang.text,
        nh: selectedCategory,
        divisi: controllerDivisi.text, 
        gajiPokok: controllerGaji.text,
        );
    WrapResponse? resData = await Api().POSTFORMDATA('$empovertimeAPI/tambah', data.toJsonSend(), context, useSnackbar: false, useToken: true);
    if (resData?.statusCode == 200) {
      snackBarsSuccess(message: 
        PRO(context).selectedCategory == "English" 
          ? "Overtime Submission Successful" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Overtime Submission Successful"
              : 'Pengajuan Lembur Berhasil'),
      );
      Get.offAll(() => MainPage());
    } else {
      snackBarsError(message: 
        PRO(context).selectedCategory == "English" 
          ? "Overtime Submission Failed" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Overtime Submission Failed"
              : 'Pengajuan Lembur Gagal'),
      );
    }
  }

  Future<void> getUserData(BuildContext context) async {
    WrapResponse? resData = await Api().GET(API_USER, context, useToken: true, useSnackbar: false);
    try {
      if (resData?.data != null) {
        UserData? userData = UserData.fromJson(resData?.data);
        userData.token = PRO(context).userData?.token;
        controllerUserID.text = userData.id.toString() ?? '';
        controllerEmpoyeeID.text = userData.employeeId.toString() ?? '';
        controllerDivisi.text = userData.personGroup.toString() ?? '';
        controllerGaji.text = userData.employee?.detailemployee?.gajiPokok.toString() ?? '';
        await PRO(context).saveLocalUser(userData);
        conditionGetAPI = true;
        update;
      } else {
        conditionGetAPI = false;
        controllerUserID.text = '';
        controllerEmpoyeeID.text = '';
        controllerDivisi.text = '';
        controllerGaji.text = '';
        update;
        ERROR_SNACK_BAR("Perhatian", "Tidak bisa mendapatkan data terbaru user");
      }
    } catch (e) {
      log('${e.toString()} line 68');
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getUserData(context);
  }
}
