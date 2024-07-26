part of '../controllers.dart';

class AuthUserData extends GetxController {
  UserData? userData;

  //Get data inventory
  Future<void> getUserData(BuildContext context) async {
    WrapResponse? resData = await Api().GET(API_USER, context, useToken: true, useLoading: true);
    if (resData?.data != null) {
      UserData? userData = UserData.fromJson(resData?.data);
      userData.token = PRO(context).userData?.token;
      await PRO(context).saveLocalUser(userData);
    } else {
      PRO(context).selectedCategory == "English" 
              ? ERROR_SNACK_BAR("Caution", "Unable to get the latest user data")
              : (PRO(context).selectedCategory == "Chinese"
                  ? ERROR_SNACK_BAR("Caution", "Unable to get the latest user data")
                  : ERROR_SNACK_BAR("Perhatian", "Tidak bisa mendapatkan data terbaru user"));
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getUserData(context);
  }
}
