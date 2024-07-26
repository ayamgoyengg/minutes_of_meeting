part of '../controllers.dart';

class OptionLeaveController extends GetxController {
  TextEditingController controllerUserID = TextEditingController();
  TextEditingController controllerEmpoyeeID = TextEditingController();
  TextEditingController controllerJamMasuk = TextEditingController();
  TextEditingController controllerJamPulang = TextEditingController();
  TextEditingController controllerTotalHari = TextEditingController();

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
  String selectedCategory = 'Sick';
  List<String> category = ['Sick', 'Unpaid leave', 'Annual leave', 'Alpha'];

  void handleSelectedCategory(dynamic itemSelected) {
    selectedCategory = itemSelected;
    update();
  }

  // file image
  File? pickImageUser;
  Future<void> handlePickImageUser(BuildContext context) async {
    final XFile? photo = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 30);
    // photo?.length().then((value) => log(value.toString()));
    if (photo != null) {
      pickImageUser = File(photo.path);
      update();
    }
  }

  bool validation(BuildContext context) {
    if (controllerUserID.text == '' ||
        controllerEmpoyeeID.text == '' ||
        controllerTanggal.text == '' ||
        controllerTotalHari.text == '' ||
        pickImageUser == '' ||
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
  
  Future<void> submitAttendance(BuildContext context) async {
    if (pickImageUser == null) {
      snackBarsError(message:
        PRO(context).selectedCategory == "English" 
          ? "Please attach a photo first" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Please attach a photo first"
              : 'Harap lampirkan foto terlebih dahulu'),
      );
      return;
    }
    if (validation(context) == false) {
      return;
    }
    handleLoadingWidget();
    PermissionData data =
        PermissionData(
          employeeId: controllerEmpoyeeID.text,
          userId: controllerUserID.text, 
          // userId: int.tryParse(controllerUserID.text), 
          date: controllerTanggal.text, 
          category: selectedCategory, 
          totDay: controllerTotalHari.text,
          // totDay: int.tryParse(controllerTotalHari.text)
        );
    WrapResponse? resData = await Api().POSTFORMDATA2('$permissionAPI/tambah', data, pickImageUser!, context, useToken: true, useSnackbar: false);
    if (resData?.statusCode == 200) {
      snackBarsSuccess(message: 
        PRO(context).selectedCategory == "English" 
          ? "Leave Submission Successful" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Leave Submission Successful"
              : 'Pengajuan Libur Berhasil'),
      );
      Get.offAll(() => MainPage());
    } else {
      snackBarsError(message: 
        PRO(context).selectedCategory == "English" 
          ? "Leave Submission Failed" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Leave Submission Failed"
              : 'Pengajuan Libur Gagal'),
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
        await PRO(context).saveLocalUser(userData);
        conditionGetAPI = true;
        update;
      } else {
        conditionGetAPI = false;
        controllerUserID.text = '';
        controllerEmpoyeeID.text = '';
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
