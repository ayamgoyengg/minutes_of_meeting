part of '../controllers.dart';

class AuthForgotPasswordController extends GetxController {
  bool showStatusSend = false;
  TextEditingController emailField = TextEditingController();

  bool validation(BuildContext context) {
    if (emailField.text == '') {
      snackBars(
        message: 'Tolong masukkan akun email anda',
      );
      return false;
    }
    return true;
  }

  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }

  Future<void> submit(BuildContext context) async {
    bool checkEmailValid = GetUtils.isEmail(emailField.text);
    showStatusSend = false;
    update();
    if (validation(context) == false) {
      return;
    }

    if (checkEmailValid == true) {
      handleLoadingWidget();
      var payload = UserForgotPassword(email: emailField.text);
      var response = await Api().POST(
          API_FORGOT_PASSWORD, payload.toJson(), context,
          useSnackbar: true);
      showStatusSend = true;

      if (response != null) {
        WrapResponse resData = response as WrapResponse;
        if (resData.statusCode == 200) {
          emailField.clear();
          loadingWidget = false;
          update();
          snackBarsSuccess(
            message:
                'Password anda berhasil terupdate, silahkan cek email anda',
          );
          Get.to(() => SignInPage());
        } else if (resData.statusCode == 400) {
          emailField.clear();
          loadingWidget = false;
          update();
          snackBarsError(
            message: 'Email anda tidak terdaftar',
          );
        }
      }
    } else {
      snackBars(
        message: 'Tolong masukkan email dengan benar',
      );
    }
  }
}
