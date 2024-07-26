part of '../controllers.dart';

class OptionInventoryreqController extends GetxController {
  TextEditingController controllerUserID = TextEditingController();
  TextEditingController controllerEmpoyeeID = TextEditingController();
  TextEditingController controllerDivision = TextEditingController();
  TextEditingController controllerJam = TextEditingController();
  TextEditingController controllerQty = TextEditingController();

  InventoryData? selectedInventory;

  List<InventoryData> inventoriesData = [];

  void handleSelectedInventory(InventoryData item) {
    selectedInventory = item;
    update();
  }

  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }

  //Get data inventory
  Future<void> getInventoriesData(BuildContext context) async {
    try {
      WrapResponse? resData = await Api().GET(API_INVENTORY, context, useSnackbar: false, useToken: true);
      // print(resData?.toJson().toString());
      // print(resData?.message);
      // print(resData?.statusCode);
      // print(resData?.toJson().toString());
      if (resData?.data['data'] != null) {
        List<InventoryData> listInventoriesData = [];
        for (var element1 in resData?.data['data']) {
          listInventoriesData.add(InventoryData.fromJson(element1));
        }
        inventoriesData = listInventoriesData;
        update();
      }
    } catch (e) {
      log('Something wrong $e');
      ERROR_SNACK_BAR("Perhatian", "Tidak bisa mendapatkan data inventories");
    }
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

  bool validation(BuildContext context) {
    if (controllerUserID.text == '' ||
        controllerEmpoyeeID.text == '' ||
        controllerDivision.text == '' ||
        controllerJam.text == '' ||
        controllerQty.text == '' ||
        controllerTanggal.text == '' ||
        selectedInventory == '') {
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
    bool conditionJam = isValidTime(controllerJam.text);
    if (conditionJam == false) {
      snackBars(message: 
        PRO(context).selectedCategory == "English" 
          ? "Please enter the time correctly, such as 08:00:00" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Please enter the time correctly, such as 08:00:00"
              : 'Harap memasukkan waktu dengan benar, seperti 08:00:00'),
      );
      return;
    }
    // bool conditionQty= isValidTime(controllerQty.text);
    // if (conditionQty== false) {
    //   snackBars(message: 'Harap memasukkan waktu dengan benar, seperti 13:00:00');
    //   return;
    // }
    if (validation(context) == false) {
      return;
    }
    handleLoadingWidget();
    InventoryrequestData data = InventoryrequestData(
        // userId: int.tryParse(controllerUserID.text),
        userId: controllerUserID.text,
        employeeId: controllerEmpoyeeID.text.toString(),
        // inventoryId:int.tryParse(selectedInventory?.idInventory.toString() ?? "") ?? 0,
        inventoryId: selectedInventory?.idInventory.toString(),
        division: controllerDivision.text,
        tglPinjam: controllerTanggal.text,
        time: controllerJam.text,
        qty: controllerQty.text,
        // qty: int.tryParse(controllerQty.text)
    );

    WrapResponse? resData = await Api().POSTFORMDATA('$inventoryrequestAPI/tambah', data.toJsonSend(), context, useSnackbar: false, useToken: true);
    if (resData?.statusCode == 200) {
      snackBarsSuccess(message: 
        PRO(context).selectedCategory == "English" 
          ? "Inventory Loan Submission Successful" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Inventory Loan Submission Successful"
              : 'Pengajuan Peminjaman Inventory Berhasil'),
      );

      Get.offAll(() => MainPage());
    } else {
      snackBarsError(message: 
        PRO(context).selectedCategory == "English" 
          ? "Inventory Loan Submission Failed" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Inventory Loan Submission Failed"
              : 'Pengajuan Peminjaman Inventory Gagal'),
      );
    }
  }

  bool conditionGetAPI = false;
  Future<void> getUserData(BuildContext context) async {
    WrapResponse? resData = await Api().GET(API_USER, context, useToken: true, useSnackbar: false);
    try {
      if (resData?.data != null) {
        UserData? userData = UserData.fromJson(resData?.data);
        userData.token = PRO(context).userData?.token;
        controllerUserID.text = userData.id.toString() ?? '';
        controllerEmpoyeeID.text = userData.employeeId.toString() ?? '';
        controllerDivision.text = userData.personGroup.toString() ?? '';
        await PRO(context).saveLocalUser(userData);
        conditionGetAPI = true;
        update;
      } else {
        conditionGetAPI = false;
        controllerUserID.text = '';
        controllerEmpoyeeID.text = '';
        controllerDivision.text = '';
        update;
        ERROR_SNACK_BAR("Perhatian", "Tidak bisa mendapatkan data terbaru user");
      }
    } catch (e) {
      log('${e.toString()} line 68');
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getUserData(context);
    await getInventoriesData(context);
  }
}
