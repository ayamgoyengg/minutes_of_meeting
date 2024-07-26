part of '../controllers.dart';

class AuthSignInController extends GetxController {
  bool checkTnC = false;
  String appVersion = "";
  String imei = "";

  Widget? validateEmail, validatePassword;
  bool obsecureText = true;

  TextEditingController emailField = TextEditingController();
  TextEditingController passwodField = TextEditingController();
  MaintenanceData? maintenanceData;

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

  void handleTnc() {
    checkTnC = !checkTnC;
    update();
  }

  Future<void> getMaintenanceData(BuildContext context) async {
    WrapResponse? resData = await Api().GET(API_MAINTENANCE, context);
    if (resData?.data['data'] != null) {
      List<MaintenanceData> listMaintenanceData = [];
      for (var element1 in resData?.data['data']) {
        listMaintenanceData.add(MaintenanceData.fromJson(element1));
      }
      print(listMaintenanceData);
      maintenanceData = listMaintenanceData.isEmpty ? null : listMaintenanceData[0];
      update();
    }
  }

  Future<void> submit(BuildContext context) async {
    bool checkEmailValid = GetUtils.isEmail(emailField.text);
    if (checkTnC == false) {
      snackBarsError(
          message:
            PRO(context).selectedCategory == "English" 
              ? 'You must agree to the Terms and Conditions in order to use this application' 
              : (PRO(context).selectedCategory == "Chinese"
                  ? 'You must agree to the Terms and Conditions in order to use this application'
                  : 'Anda harus mensetujui Syarat dan Ketentuan yang berlaku untuk dapat menggunakan aplikasi ini'),
              );
      return;
    }
    if (checkEmailValid == true) {
      var payload = UserLogin(email: emailField.text, password: passwodField.text);
      log(payload.toJson().toString());
      WrapResponse? resData = await Api().POSTFORMDATA(API_SIGNIN, payload.toJson(), context, useSnackbar: false);
      if (resData?.statusCode == 200) {
        emailField.clear();
        passwodField.clear();
        update();
        UserData? userData = UserData.fromJson(resData?.data['user']);
        userData.token = resData?.data['access_token'];
        await PRO(context).saveLocalUser(userData);
        print(PRO(context).userData?.toJson().toString());
        Get.offAll(() => MainPage());
      } else {
        snackBarsError(message: 
          PRO(context).selectedCategory == "English" 
              ? "Sorry, wrong username or password" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "Sorry, wrong username or password"
                  : 'Maaf username atau password salah'),
        );
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

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = "${packageInfo.version}+${packageInfo.buildNumber}";
    update();
  }

  Future<void> getImei() async {
    try {
      imei = (await UniqueIdentifier.serial)!;
    } catch (e) {
      // imei = 'Failed to get Unique Identifier';
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getMaintenanceData(context);
    getAppVersion();
    getImei();
  }
}

