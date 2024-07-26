part of '../controllers.dart';

class OptionReimbursementController extends GetxController {
  TextEditingController controllerUserID = TextEditingController();
  TextEditingController controllerEmpoyeeID = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerNominal = TextEditingController();

  List<ReimbursementData> reimbursementData = [];

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

  Future<void> getReimbursementData(BuildContext context) async {
    try {
      WrapResponse? resData = await Api().GET(reimbursementAPI, context, useSnackbar: false, useToken: true, useLoading: false);
      log(resData?.statusCode.toString() ?? '');
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<ReimbursementData> listReimbursementData = [];
          for (var element1 in resData?.data['data']) {
            listReimbursementData.add(ReimbursementData.fromJson(element1));
          }
          listReimbursementData.sort((a, b) => (b.idReimbursement ?? 0).compareTo(a.idReimbursement ?? 0));
          reimbursementData = listReimbursementData;
          update();
        }
        snackBarsSuccess(message: "${resData?.metaData?.message ?? 'Berhasil'}");
      } else {
        snackBarsError(message: "${resData?.metaData?.message ?? 'Berhasil'}");
      }
    } catch (e) {
      snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> submitAttendance(BuildContext context) async {
    if (pickImageUser == null) {
      snackBarsError(message: "Harap foto nota terlebih dahulu");
      return;
    }
    ReimbursementData data =
        ReimbursementData(employeeId: controllerEmpoyeeID.text, userId: controllerUserID.text, name: controllerName.text, title: controllerTitle.text, nominal: controllerNominal.text
        );
    WrapResponse? resData = await Api().POSTFORMDATA3('$reimbursementAPI/tambah', data, pickImageUser!, context, useToken: true, useSnackbar: false);
    if (resData?.statusCode == 200) {
      snackBarsSuccess(message: resData?.metaData?.message ?? 'Berhasil');
      Get.offAll(() => MainPage());
    } else {
      snackBarsError(message: resData?.metaData?.message ?? 'Gagal');
    }
  }

  void initPage(BuildContext context) {
    controllerUserID.text = PRO(context).userData?.id.toString() ?? '';
    controllerEmpoyeeID.text = PRO(context).userData?.employeeId.toString() ?? '';
    controllerName.text = PRO(context).userData?.name.toString() ?? '';
    getReimbursementData(context);
  }
}
