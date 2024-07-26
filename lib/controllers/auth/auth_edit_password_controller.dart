part of '../controllers.dart';

class AuthEditPasswordController extends GetxController {
  Widget? validatePassword;
  bool obsecureText = true;

  TextEditingController passwordField = TextEditingController();
  TextEditingController confirmPasswordField = TextEditingController();
  TextEditingController oldPasswordField = TextEditingController();

  void toggleObsecureText() {
    obsecureText = !obsecureText;
    update();
  }

  void onChangePassword(String val) {
    if (val.isEmpty) {
      validatePassword = null;
    } else if (val.length < 6) {
      validatePassword = ERROR_VALIDATION_FIELD("Password minimal 6 digit");
    } else {
      validatePassword = null;
    }
    update();
  }

  bool validation(BuildContext context) {
    if (passwordField.text == '' ||
        confirmPasswordField.text == '' ||
        oldPasswordField.text == '' ) {
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

  bool validation2(BuildContext context) {
    if (passwordField.text != confirmPasswordField.text ) {
      snackBars(message: 
      PRO(context).selectedCategory == "English" 
      ? "The new password and new password confirmation are not the same. Please try again" 
      : (PRO(context).selectedCategory == "Chinese"
          ? "The new password and new password confirmation are not the same. Please try again"
          : "Password baru dan konfirmasi password baru tidak sama. Silahkan coba lagi"),
      );
      return false;
    }
    return true;
  }

  bool validation3(BuildContext context) {
    String password = passwordField.text;
    if (password.length < 8) {
      snackBars(
        message: PRO(context).selectedCategory == "English"
            ? "Password must be at least 8 characters long"
            : (PRO(context).selectedCategory == "Chinese"
                ? "Password must be at least 8 characters long"
                : 'Password harus memiliki minimal 8 karakter'),
      );
      return false;
    }
    return true;
  }


  Future<void> submit(BuildContext context) async {
    if (validation(context) == false) {
      return;
    }
    if (validation2(context) == false) {
      return;
    }
    if (validation3(context) == false) {
      return;
    }
    var payload = UserEditPassword(email: PRO(context).userData?.email, password: passwordField.text, passwordConfirmation: confirmPasswordField.text, oldPassword: oldPasswordField.text);
    Loading.show(context: context);
    WrapResponse? resData = await Api().POST(API_USER_RESET_PASSWORD, payload.toJson(), context, useSnackbar: true, useToken: true);
    if (resData?.statusCode == 200) {
      passwordField.clear();
      confirmPasswordField.clear();
      oldPasswordField.clear();
      update();
      snackBarsSuccess(message: 
        PRO(context).selectedCategory == "English" 
                ? "Your password has been successfully changed" 
                : (PRO(context).selectedCategory == "Chinese"
                    ? "Your password has been successfully changed"
                    : "Password anda berhasil diganti"),
      );
      Get.offAll(() => MainPage());
    } else {
      Loading.hide();
      snackBarsError(message: 
        PRO(context).selectedCategory == "English" 
              ? "Your current password is incorrect" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "Your current password is incorrect"
                  : "Password anda saat ini salah"),
      );
    }
  }
}