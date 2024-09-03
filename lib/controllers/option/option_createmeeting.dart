part of '../controllers.dart';

class OptionCreateMeetingController extends GetxController {
  TextEditingController controllerOwnerID = TextEditingController();
  TextEditingController controllerTitle = TextEditingController();
  final QuillEditorController controllerNotes = QuillEditorController();
  TextEditingController controllerPassword = TextEditingController();
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }

  StmeetingData? selectedStmeeting;
  List<StmeetingData> stmeetingsData = [];
  void handleSelectedStmeeting(StmeetingData item) {
    selectedStmeeting = item;
    update();
  }

  Future<void> getStmeetingsData(BuildContext context) async {
    try {
      WrapResponse? resData = await Api().GET(API_STMEETING, context, useSnackbar: false, useToken: true);
      if (resData?.data['data'] != null) {
        List<StmeetingData> listStmeetingsData = [];
        for (var element1 in resData?.data['data']) {
          listStmeetingsData.add(StmeetingData.fromJson(element1));
        }
        stmeetingsData = listStmeetingsData;
        update();
      }
    } catch (e) {
      log('Something wrong $e');
      ERROR_SNACK_BAR("Perhatian", "Tidak bisa mendapatkan data inventories");
    }
  }

  UserData? selectedForward;
  List<UserData> forwardsData = [];
  void handleSelectedForward(UserData item) {
    selectedForward = item;
    update();
  }

  Future<void> getForwardsData(BuildContext context) async {
    try {
      WrapResponse? resData = await Api().GET(API_USER, context, useSnackbar: false, useToken: true);
      if (resData?.data['data'] != null) {
        List<UserData> listForwardsData = [];
        for (var element1 in resData?.data['data']) {
          listForwardsData.add(UserData.fromJson(element1));
        }
        forwardsData = listForwardsData;
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

  Future<void> getUserData(BuildContext context) async {
    WrapResponse? resData = await Api().GET(API_USER, context, useToken: true, useSnackbar: false);
    try {
      if (resData?.data != null) {
        UserData? userData = UserData.fromJson(resData?.data);
        userData.token = PRO(context).userData?.token;
        controllerOwnerID.text = userData.id.toString() ?? '';
        controllerPassword.text = 'MaxMeeting';
        await PRO(context).saveLocalUser(userData);
        update;
      } else {
        controllerOwnerID.text = '';
        controllerPassword.text = 'MaxMeeting';
        update;
        ERROR_SNACK_BAR("Perhatian", "Tidak bisa mendapatkan data terbaru user");
      }
    } catch (e) {
      log('${e.toString()} line 68');
    }
  }
  
Future<bool> validation(BuildContext context) async {
  // Get the current text from the Quill editor
  String notesText = await controllerNotes.getText();

  if (controllerOwnerID.text.isEmpty ||
      controllerTitle.text.isEmpty ||
      controllerTanggal.text.isEmpty ||
      selectedStmeeting == null ||
      selectedForward == null ||
      notesText.isEmpty ||
      controllerPassword.text.isEmpty) {
    snackBars(message: 'Tolong lengkapi form di atas');
    return false;
  }
  return true;
}




  // submit
  Future<void> submit(BuildContext context) async {
  if (!await validation(context)) {
    return;
  }

  handleLoadingWidget();

  // Get the current text from the Quill editor
  String notesText = await controllerNotes.getText();

  MeetingData data = MeetingData(
    ownerId: controllerOwnerID.text.toString(),
    stmeetingId: selectedStmeeting?.idStmeeting.toString(),
    forwardId: selectedForward?.id.toString(),
    title: controllerTitle.text,
    date: controllerTanggal.text,
    notes: notesText,  // Use the text from Quill editor
    password: controllerPassword.text,
    // qty: int.tryParse(controllerQty.text)
  );

  WrapResponse? resData = await Api().POSTFORMDATA(
    '$API_MEETING/tambah',
    data.toJsonSend(),
    context,
    useSnackbar: false,
    useToken: true,
  );

  if (resData?.statusCode == 200) {
    snackBarsSuccess(
      message: PRO(context).selectedCategory == "English" 
        ? "Inventory Loan Submission Successful" 
        : (PRO(context).selectedCategory == "Chinese"
            ? "Inventory Loan Submission Successful"
            : 'Pembuatan Meeting Berhasil'),
    );

    Get.offAll(() => MainPage());
  } else {
    snackBarsError(
      message: PRO(context).selectedCategory == "English" 
        ? "Inventory Loan Submission Failed" 
        : (PRO(context).selectedCategory == "Chinese"
            ? "Inventory Loan Submission Failed"
            : 'Pembuatan Meeting Gagal'),
    );
  }
}



  Future<void> initPage(BuildContext context) async {
    await getUserData(context);
    await getStmeetingsData(context);
    await getForwardsData(context);
  }
}
