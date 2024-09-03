part of '../controllers.dart';

class AuthEPController extends GetxController {
  TextEditingController emailField = TextEditingController();
  TextEditingController nameField = TextEditingController();



  Future<void> submit(BuildContext context) async {
    bool checkEmailValid = GetUtils.isEmail(emailField.text);
    if (checkEmailValid == true) {
      var payload = UserEditProfile(
        email: emailField.text, 
        name: nameField.text, 
      );
      Loading.show(context: context);
      WrapResponse? resData = await Api().POSTFORMDATA('update/$API_USER', payload.toJson(), context, useSnackbar: true, useToken: true);
      if (resData?.statusCode == 200) {
        emailField.clear();
        nameField.clear();
        update();
        WrapResponse? resGetData = await Api().GET(API_USER, context, useToken: true);
        UserData? userData = UserData.fromJson(resGetData?.data);
        userData.token = PRO(context).userData?.token;
        await PRO(context).saveLocalUser(userData);
        snackBarsSuccess(message: 
          PRO(context).selectedCategory == "English" 
              ? "Profile successfully changed" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "Profile successfully changed"
                  : "Profile berhasil diganti"),
        );
        Get.offAll(() => MainPage());
      } else {
        snackBars(message: resData?.message ?? "");
      }
    } else {
      snackBarsError(message: 
        PRO(context).selectedCategory == "English" 
              ? "Please enter email correctly" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "Please enter email correctly"
                  : "Tolong masukkan email dengan benar"),
      );
    }
  }

  Future<void> initPage(BuildContext context) async {
    emailField.text = PRO(context).userData?.email ?? '';
    nameField.text = PRO(context).userData?.name ?? '';
  }
}
