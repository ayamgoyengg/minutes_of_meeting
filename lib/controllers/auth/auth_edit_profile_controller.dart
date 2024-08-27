part of '../controllers.dart';

class AuthEPController extends GetxController {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }

  List<UserData> userData = [];

  Future<void> getUser(BuildContext context) async {
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api()
          .GET(API_USER, context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<UserData> listUserData = [];
          for (var element1 in resData?.data['data']) {
            listUserData.add(UserData.fromJson(element1));
          }
          listUserData
              .sort((a, b) => (b.id ?? 0).compareTo(a.id ?? 0));
          userData = listUserData; // Make sure this line is present
          update(); // This updates the UI
          print('Successfully fetched data');
        }
      } else {
        print('Failed to fetch data');
      }
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();
      print('Error: $e');
    }
  }

  // edit
  Future<void> edit(BuildContext context, UserData user) async {
    handleLoadingWidget();
    // Get the current text from the Quill editor
    String nameText = controllerName.text;
    String emailText = controllerEmail.text;

    UserData data = UserData(
      name: nameText,
      email: emailText
    );

    WrapResponse? resData = await Api().POSTFORMDATA(
      'update/$API_USER/${user.id}',
      data.toJsonSend(),
      context,
      useSnackbar: true,
      useToken: true,
    );

  if (resData?.statusCode == 200) {
    snackBarsSuccess(
      message: 'Data meeting berhasil di update',
    );

    Get.offAll(() => FolderPage());
  } else {
    snackBarsError(
      message: 'Gagal edit data meeting',
    );
  }
}

  Future<void> initPage(BuildContext context) async {
    await getUser(context);
  }
}
