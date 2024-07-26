part of '../controllers.dart';

class OptionWhistleblowingController extends GetxController {
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }

  String statusSaveOrPost = 'Kirim';

  List<WhistleblowingData> dataWhistleblowing = [];

  ScrollController controllerDataWhistleblowing = ScrollController();

  TextEditingController controllerUserID = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerComment = TextEditingController();

  Future<void> getWhistleblowing(BuildContext context) async {
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api().GET(API_WHISTLEBLOWING, context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<WhistleblowingData> listDataWhistleblowing = [];
          for (var element1 in resData?.data['data']) {
            listDataWhistleblowing.add(WhistleblowingData.fromJson(element1));
          }
          listDataWhistleblowing.sort((a, b) => (b.idWhistleblowing ?? 0).compareTo(a.idWhistleblowing ?? 0));
          dataWhistleblowing = listDataWhistleblowing;
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
    if (controllerUserID.text == '' ||
        controllerName.text == '' ||
        controllerComment.text == '') {
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

  Future<void> submitWhistleblowing(BuildContext context) async {
    if (validation(context) == false) {
      return;
    }
    WhistleblowingData itemSend = WhistleblowingData(
      // userId: int.tryParse(PRO(context).userData?.id?.toString() ?? "") ?? 0,
      userId : PRO(context).userData?.id.toString(),
      name: PRO(context).userData?.name.toString(), 
      comment: controllerComment.text);
    WrapResponse? resData = await Api().POSTFORMDATA('$API_WHISTLEBLOWING/tambah', itemSend.toJsonSend(), context, useToken: true, useSnackbar: true);
    if (resData?.statusCode == 200) {
      controllerComment.text = '';
      statusSaveOrPost = 'Kirim';
      update();
      snackBarsSuccess(message: 
        PRO(context).selectedCategory == "English" 
          ? "Successfully added a complaint" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Successfully added a complaint"
              : 'Berhasil menambahkan pengaduan'),  
      );
      await getWhistleblowing(context);
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
        controllerName.text = userData.name.toString() ?? '';
        await PRO(context).saveLocalUser(userData);
        conditionGetAPI = true;
        update;
      } else {
        conditionGetAPI = false;
        controllerUserID.text = '';
        controllerName.text = '';
        update;
        ERROR_SNACK_BAR("Perhatian", "Tidak bisa mendapatkan data terbaru user");
      }
    } catch (e) {
      log('${e.toString()} line 68');
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getUserData(context);
    await getWhistleblowing(context);
  }
}
