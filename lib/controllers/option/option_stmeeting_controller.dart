part of '../controllers.dart';

class OptionStmeetingController extends GetxController {
  TextEditingController controllerName = TextEditingController();
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }
  
  // Get Data
  List<StmeetingData> stmeetingData = [];

  Future<void> getStmeeting(BuildContext context) async {
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api().GET(API_STMEETING, context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<StmeetingData> listStmeetingData = [];
          for (var element1 in resData?.data['data']) {
            listStmeetingData.add(StmeetingData.fromJson(element1));
          }
          stmeetingData = listStmeetingData;
          update();
        }
      } else {}
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();

      snackBarsError(message: 'Something wrong $e');
    }
  }

  bool validation(BuildContext context) {
  if (controllerName.text.isEmpty) {
    snackBars(message: "Lengkapi form diatas");
    return false;
  }
  return true;
}

  // Submit Data
  Future<void> submit(BuildContext context) async {
  if (!validation(context)) {
    return;
  }

  StmeetingData data = StmeetingData(
    name: controllerName.text,
  );

  print(data);  // This should now print the data if validation passes

  WrapResponse? resData = await Api().POSTFORMDATA(
    '$API_STMEETING/tambah',
    data.toJsonSend(),
    context,
    useSnackbar: false,
    useToken: true,
  );

  if (resData?.statusCode == 200) {
    snackBarsSuccess(message: 'Penambahan Perusahaan Berhasil');
    Get.offAll(() => CreateMomPage());
  } else {
    snackBarsError(message: 'Maaf gagal tambah data');
  }
}

  
  Future<void> initPage(BuildContext context) async {
    await getStmeeting(context);
  }
}
