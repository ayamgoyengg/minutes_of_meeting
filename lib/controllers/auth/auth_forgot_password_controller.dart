part of '../controllers.dart';

class AuthForgotPasswordController extends GetxController {
  bool showStatusSend = false;
  TextEditingController emailField = TextEditingController();


  bool validation(BuildContext context) {
    if (emailField.text == '' ) {
      snackBars(message: 
        PRO(context).selectedCategory == "English" 
              ? "Please enter your email account" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "Please enter your email account"
                  : 'Tolong masukkan akun email anda'),
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
    var response = await Api().POST(API_FORGOT_PASSWORD, payload.toJson(), context, useSnackbar: true);
    showStatusSend = true;
        
    if (response != null) {
      WrapResponse resData = response as WrapResponse;
      if (resData.statusCode == 200) {
       emailField.clear();
        loadingWidget = false;
        update();
        snackBarsSuccess(message: 
          PRO(context).selectedCategory == "English" 
              ? "Your password has been successfully updated, please check your email." 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "Your password has been successfully updated, please check your email."
                  : 'Password anda berhasil terupdate, silahkan cek email anda'),
        );
        Get.to(() => SignInPage()); 
      } else if (resData.statusCode == 400) {
        emailField.clear();
        loadingWidget = false;
        update();
        snackBarsError(message: 
          PRO(context).selectedCategory == "English" 
              ? "Your email is not registered" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "Your email is not registered"
                  : 'Email anda tidak terdaftar'),
        );
      }
    }
  } else {
    snackBars(message: 
      PRO(context).selectedCategory == "English" 
              ? "Please enter email correctly" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "Please enter email correctly"
                  : 'Tolong masukkan email dengan benar'),
    );
  }
}


}